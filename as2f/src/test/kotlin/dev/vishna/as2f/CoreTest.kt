package dev.vishna.as2f

import com.eyeem.strings2arb.DartI18N
import dev.vishna.stringcode.asResource
import kotlinx.coroutines.runBlocking
import org.amshove.kluent.`should be equal to`
import org.amshove.kluent.`should contain all`
import org.junit.Test

class CoreTest {

    @Test fun `test carrots`() = runBlocking<Unit> {
        val localizableEN = listOf(
                BasicLocalizable("en", "hello_world", "Hello World"),
                ArgsLocalizable("en", "hello_friend", "Hello \${friend}", listOf("friend")),
                ArgsLocalizable("en", "hello_friend2", "Hello \${friend1} and \${friend2}", listOf("friend1", "friend2")),
                QuantityLocalizable("en", "carrot", listOf("count"), listOf(
                        QuantityItem(Quantity.one, "\${count} carrot"),
                        QuantityItem(Quantity.many, "\${count} carrots")
                ))
        )

        val localizablePL = listOf(
                BasicLocalizable("pl","hello_world", "Witaj świecie!"),
                ArgsLocalizable("pl", "hello_friend", "Cześć \${friend}", listOf("friend")),
                ArgsLocalizable("pl", "hello_friend2", "Cześć \${friend1} i \${friend2}", listOf("friend1", "friend2")),
                QuantityLocalizable("pl", "carrot", listOf("count"), listOf(
                        QuantityItem(Quantity.one, "\${count} marchewka"),
                        QuantityItem(Quantity.few, "\${count} marchewki"),
                        QuantityItem(Quantity.many, "\${count} marchewek")
                ))
        )

        val parentClass = SModel(
                locale = "en",
                isOverride = false,
                textDirection = TextDirection.ltr,
                localizables = localizableEN)

        val subClass = SModel(
                locale = "pl",
                isOverride = true,
                textDirection = TextDirection.ltr,
                localizables = localizablePL)

        val dartI18N = DartI18N(listOf(parentClass, subClass))

        dartI18N.emit() `should be equal to` "/carrot.dart".asResource()
    }

    @Test fun findArgs() {
        val expressionWithSomeArgs = "沒有在\${arg1}的\"\${arg2}\"結果是\${arg3}\"好的\${arg4}\"好的\${arg5}\"好的\${arg6}\"好的"
        val args = expressionWithSomeArgs.findArgs()
        args `should contain all` listOf("arg1", "arg2", "arg3", "arg4", "arg5", "arg6")
    }

    @Test fun findNums() {
        val expressionWithSomeArgs = "沒有在\${num1}的\"\${num2}\"結果是\${num3}\"好的\${num4}\"好的\${num5}\"好的\${num6}\"好的"
        val args = expressionWithSomeArgs.findArgs()
        args `should contain all` listOf("num1", "num2", "num3", "num4", "num5", "num6")
    }
}