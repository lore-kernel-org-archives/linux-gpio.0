From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: atlas7: support atlas7 step B changes
Date: Fri, 16 Oct 2015 21:58:13 +0200
Message-ID: <CACRpkdb-cq=6H7h+Vzapj4YLpKM8d4YA5HOjgXCrZWkkJqmf4Q@mail.gmail.com>
References: <1444372278-3044-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:32849 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754010AbbJPT6O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 15:58:14 -0400
Received: by obbwb3 with SMTP id wb3so72783815obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 12:58:13 -0700 (PDT)
In-Reply-To: <1444372278-3044-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

On Fri, Oct 9, 2015 at 8:31 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Wei Chen <Wei.Chen@csr.com>
>
> The the pin groups and pin functions have been changed
> in atlas7 step B soc. We have to update the driver
> to support step B chip.
>
> Changes:
> 1. add 5 jtag pins to IOC_TOP:
>         "jtag_tdo", "jtag_tms","jtag_tck", "jtag_tdi", "jtag_trstn"
>         these 5 pins can be mutiplex with other functions, so we
>         have to conver these 5 pins in pinmux.
> 2. add pin groups for audio digmic, audio spdif, can transceiver
>         en, can transceiver stb, i2s0, i2s1 and jtag.
> 3. serval pins can be located to more PADs:
>         audio_uart0_urfs, audio_uart1_urfs, audio_uart2_urfs,
>         audio_uart2_urxd, audio_uart2_usclk, audio_uart2_utfs,
>         audio_uart2_utxd, can0_rxd, can0_txd, can1_rxd, can1_txd
>         jtag_ntrst, jtag_swdiotms, jtag_tck, jtag_tdi, jtag_tdo,
>         pw_cko0, pw_cko1, pw_i2s01, pw_pwm0, pw_pwm1, sd2_cdb,
>         sd2_wpb, uart2_cts, uart2_rts, uart2_rxd, uart2_txd,
>         uart3_cts, uart3_rts, uart3_rxd, uart3_txd, uart4_cts,
>         uart4_rts, usb0_drvvbus, usb1_drvvbus.
>
> Because of Changes#3, some functions should have more than one
> pin groups. So we have to split the original pin group to serval
> pin groups.
>
> For example:
> audio_uart0 has 5 pins, on STEPA, each of these 5 pins only has
> one related PAD. But on STEPB, audio_uart0_urfs has 4 related
> PAD.
> So we place the 4 pins with one PAD into a single pin group:
>         audio_uart0_basic_group.
> and place urfs pin wtih different PADs to 4 different pin groups:
>         audio_uart0_urfs_group0, ..., audio_uart0_urfs_group3
>
> A full audio_uart0 pin group can be:
>         pinctrl-0 = <&audio_uart0_basic_group &audio_uart0_urfs_group0>;
> If audio_uart0 pin group encountered some confiction, we only have
> to change the urfs group:
>         pinctrl-0 = <&audio_uart0_basic_group &audio_uart0_urfs_group2>;
>
> Signed-off-by: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
