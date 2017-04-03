From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: grand I2C rename
Date: Mon, 3 Apr 2017 09:30:39 +0200
Message-ID: <CAMuHMdUR0woajKFLSE0w+g1BN1pFLCEMh8uuBSTew4AY0WOUzg@mail.gmail.com>
References: <20170330165412.949875557@cogentembedded.com> <CAMuHMdXa+y9mJsMD9v4o9AOxyp__2LZmqpAR7=4PG3x_7pSQDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34188 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751282AbdDCHak (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2017 03:30:40 -0400
In-Reply-To: <CAMuHMdXa+y9mJsMD9v4o9AOxyp__2LZmqpAR7=4PG3x_7pSQDw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 31, 2017 at 1:01 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Mar 30, 2017 at 6:53 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> The R8A7791 PFC driver  was apparently based on the preliminary revisions
>> of  the  user's manual, which called all the I2C signals {SCL|SDA}<n> and
>> MOD_SEL register fields SEL_IIC<n> without making a difference between two
>> types of the I2C controllers used. The recent manual calls the signals
>> {I2C|IIC}<n>_{SCL|SDA> and the MOD_SEL fields SEL_{I2C|IIC}<n> finally
>> making this difference. Follow the suit, also renaming the I2C{7|8} pin
>> arrays and groups/functions (luckily, they haven't been used so far).
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
>> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
>> @@ -119,22 +119,22 @@ enum {
>>         /* IPSR0 */
>>         FN_D0, FN_D1, FN_D2, FN_D3, FN_D4, FN_D5, FN_D6, FN_D7, FN_D8,
>>         FN_D9, FN_D10, FN_D11, FN_D12, FN_D13, FN_D14, FN_D15,
>> -       FN_A0, FN_ATAWR0_N_C, FN_MSIOF0_SCK_B, FN_SCL0_C, FN_PWM2_B,
>> +       FN_A0, FN_ATAWR0_N_C, FN_MSIOF0_SCK_B, FN_I2C0_SCL_C, FN_PWM2_B,
>
> While I have no issue with renaming internal definitions...
>
>> @@ -4507,12 +4514,12 @@ static const struct sh_pfc_pin_group pin
>>         SH_PFC_PIN_GROUP(i2c4),
>>         SH_PFC_PIN_GROUP(i2c4_b),
>>         SH_PFC_PIN_GROUP(i2c4_c),
>> -       SH_PFC_PIN_GROUP(i2c7),
>> -       SH_PFC_PIN_GROUP(i2c7_b),
>> -       SH_PFC_PIN_GROUP(i2c7_c),
>> -       SH_PFC_PIN_GROUP(i2c8),
>> -       SH_PFC_PIN_GROUP(i2c8_b),
>> -       SH_PFC_PIN_GROUP(i2c8_c),
>> +       SH_PFC_PIN_GROUP(iic0),
>> +       SH_PFC_PIN_GROUP(iic0_b),
>> +       SH_PFC_PIN_GROUP(iic0_c),
>> +       SH_PFC_PIN_GROUP(iic1),
>> +       SH_PFC_PIN_GROUP(iic1_b),
>> +       SH_PFC_PIN_GROUP(iic1_c),
>
> I do object against renaming the user-visible names, like pin groups...
>
>> @@ -5298,8 +5305,8 @@ static const struct sh_pfc_function pinm
>>         SH_PFC_FUNCTION(i2c2),
>>         SH_PFC_FUNCTION(i2c3),
>>         SH_PFC_FUNCTION(i2c4),
>> -       SH_PFC_FUNCTION(i2c7),
>> -       SH_PFC_FUNCTION(i2c8),
>> +       SH_PFC_FUNCTION(iic0),
>> +       SH_PFC_FUNCTION(iic1),
>
> ... and pin functions. Technically, they are part of the DT bindings,
> and thus are not allowed to change.
>
> IMHO either the user-visible names should be left alone, or the new names
> should be added as alternatives, next to the existing names.

If we go the second route, that could easily be supported using new
SH_PFC_PIN_GROUP_ALIAS() and SH_PFC_FUNCTION_ALIAS() macros,
to be used like

        SH_PFC_PIN_GROUP(i2c7, iic0);

        SH_PFC_FUNCTION_ALIAS(i2c7, iic0);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
