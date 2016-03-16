From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Wed, 16 Mar 2016 13:27:49 +0100
Message-ID: <CACRpkdZ25kGPZ7SfeactfqY9PNrH4++v0V727Rbmh-NQCLuE4w@mail.gmail.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
	<20160311093856.GN1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com>
	<20160314085002.GY1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10643@SHSMSX101.ccr.corp.intel.com>
	<CACRpkdbT9w+XXOUSuzGY+NUkxkKvoUK7KXMRi8R5TJK8Ytk+KQ@mail.gmail.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10AC2@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33862 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbcCPM1u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 08:27:50 -0400
Received: by mail-ob0-f174.google.com with SMTP id ts10so49136823obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 05:27:50 -0700 (PDT)
In-Reply-To: <0DD381DBF8F68D419C32ACFCEB28EB2521D10AC2@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zheng, Qi" <qi.zheng@intel.com>, Hans Holmberg <hans.holmberg@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: "Westerberg, Mika" <mika.westerberg@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 15, 2016 at 3:17 AM, Zheng, Qi <qi.zheng@intel.com> wrote:
>> On Mon, Mar 14, 2016 at 9:56 AM, Zheng, Qi <qi.zheng@intel.com> wrot=
e:
>
>> The "pi330532" device on Broxton requires this function to manually
>> trigger an GPIO input interrupt.
> (...)
>> We have gone through this requirement from CHT to BXT, there was no
>> other better way to simulate the GPIO interrupt for the use of those=
 devices.
>
>> I what you want is to trigger IRQs on GPIO lines using software we
>> need to add that to the GPIOlib subsystem, so this register gets acc=
essed
>> from the GPIO side of things, not through pin control I think?
>
> We have pinctrl control map locally.
> The RX inversion is implemented by pinctrl control calls, pinctrl_pm_=
select_default_state
> and pinctrl_pm_select_sleep_state.
>
>> We have so many diverse function pointers in the gpiochip, so abilit=
y to
>> trigger/test IRQs from software is certainly not a burden.
>
>> I don't understand the real-world usecase though, please explain wha=
t kind of problem
>> this is trying to overcome? Why does this pi330532 driver need to do=
 that, why can
>> it not just inform the driver that needs this interrupt that it shou=
ld wake up, e.g by
>> using a notification or just an open-coded function call or whatever=
?
>
> According to the pi330532 driver owner,
> "
> we needed this support to simulate the HPD interrupt behavior as we d=
on=E2=80=99t have
> dedicated interrupt line for Type-C DP HPD.

- What is a HPD interrupt?
- What is a Type-C DP HPD?
- Again why can't you just use a notifier or function call?

> We don=E2=80=99t have any notifications mechasism b/w USB and display=
/Gfx stack and
> also not the ideal way to handle.  HPD toggling is the preferred appr=
oach suggested
> by VPG and HW teams to meet timing requirements also.

What is VPG? Now it seems Intel's internal organization is being used a=
s
part of the argument to get this change in and that makes me a bit
annoyed.

If there is no good notification mechanism then implement one instead
of starting to software-generate hardware interrupts.

I also start to get the feeling that these USB and display stacks
you are referring to are not the upstream versions.

> static void hpd_trigger(struct pi3usb30532_mux *chip, int state)
> {
>         dev_info(&chip->client->dev, "[HPD trigger] state : %d\n", st=
ate);
>
>         if (state)
>                 pinctrl_pm_select_default_state(chip->dev);
>         else
>                 pinctrl_pm_select_sleep_state(chip->dev);
> }

Can we get the *TECHNICAL* explanation of why this thing needs
to be done instead of using a notifier or function call?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
