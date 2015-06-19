From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [Question] How to implement GPIO driver for sparse hw numbers?
Date: Fri, 19 Jun 2015 12:27:42 +0900
Message-ID: <CAK7LNARNUqjwcOvTwjsq8ck=hPgn83Gk=1vikkmq5KUxmYSjnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg003.nifty.com ([202.248.44.41]:42843 "EHLO
	conssluserg003-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752261AbbFSD1s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 18 Jun 2015 23:27:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi GPIO experts,


I am trying to implement a new GPIO driver for a new SoC.

I'd like to consult experts how to solve my problem.

According to the hardware specification book,
the GPIO ports on my SoC are labelled from PORT0 to PORT307 as follows:

 PORT0,   PORT1,   PORT2,       PORT7,    --> register offset 0x0
 PORT10,  PORT11,  PORT12, ..., PORT17    --> register offset 0x8
 PORT20,  PORT21,  PORT22, ..., PORT27,   --> register offset 0x10
       ...
 PORT290, PORT291, PORT292, ... PORT297   --> register offset 0xe8
 PORT300, PORT301, PORT302, ... PORT307   --> register offset 0x90


Unfortunately, the port numbers are not contiguous.
The port numbers with 8 or 9 in the one's place
(such as PORT8, PORT9, PORT18, PORT19, ...) are missing.


In my understanding, the GPIO driver framework requires that
the hw numbers should be contiguous within each GPIO chip.

If I try to follow this rule, the hwnum given to GPIOLIB functions
does not correspond to the port documented in the hardware specification.

  gpiochip_get_desc(chip, 0);   /* get descripter of PORT0 */
  gpiochip_get_desc(chip, 1);   /* get descripter of PORT1 */
        ...
  gpiochip_get_desc(chip, 7);   /* get descripter of PORT7 */
  gpiochip_get_desc(chip, 8);   /* get descripter of PORT10 */  /* confusing! */
  gpiochip_get_desc(chip, 9);   /* get descripter of PORT11 */  /* confusing! */
  gpiochip_get_desc(chip, 10);   /* get descripter of PORT12 */  /*
confusing! */
        ...


One solution I have come up with is to divide the GPIO chip into 31 banks,
with 8 ports in each.
But, I hesitate to describe 31 nodes in my device tree.

   port0x : gpio@55000000 {
             compatible = ...
             reg = <0x55000000 0x8>;
   };

   port1x : gpio@55000008 {
             compatible = ...
             reg = <0x55000008 0x8>;
   };

          ...

   port29x : gpio@5500008c {
             compatible = ...
             reg = <0x5500008c 0x8>;
   };

   port30x : gpio@55000090 {
             compatible = ...
             reg = <0x55000090 0x8>;
   };


Any good ideas?

Thanks,



-- 
Best Regards
Masahiro Yamada
