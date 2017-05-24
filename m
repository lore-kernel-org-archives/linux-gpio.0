From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc: sysdev: simple_gpio: fix Oops in gpio save_regs function
Date: Wed, 24 May 2017 10:01:55 +0200 (CEST)
Message-ID: <20170524080156.1C4936EB78@pc13941vm.idsi0.si.c-s.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

of_mm_gpiochip_add_data() generates an Oops for NULL pointer dereference.

of_mm_gpiochip_add_data() calls mm_gc->save_regs() before
setting the data, therefore ->save_regs() cannot use gpiochip_get_data()

Fixes: 937daafca774b ("powerpc: simple-gpio: use gpiochip data pointer")
Cc: stable@vger.kernel.org

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/sysdev/simple_gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/simple_gpio.c b/arch/powerpc/sysdev/simple_gpio.c
index ef470b470b04..6afddae2fb47 100644
--- a/arch/powerpc/sysdev/simple_gpio.c
+++ b/arch/powerpc/sysdev/simple_gpio.c
@@ -75,7 +75,8 @@ static int u8_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static void u8_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct u8_gpio_chip *u8_gc = gpiochip_get_data(&mm_gc->gc);
+	struct u8_gpio_chip *u8_gc =
+		container_of(mm_gc, struct u8_gpio_chip, mm_gc);
 
 	u8_gc->data = in_8(mm_gc->regs);
 }
-- 
2.12.0
