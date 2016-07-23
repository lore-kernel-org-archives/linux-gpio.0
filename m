From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: fix pincontrol definition for marvell
Date: Sat, 23 Jul 2016 15:45:50 +0200
Message-ID: <15618013eb0.2764.107cef0f820c2f5d7b7f41463071c310@gmail.com>
References: <20160716150704.GA5883@andreas>
 <5792510F.5070305@gmail.com>
 <20160722224317.GB1594@imap.1und1.de>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34318 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbcGWNp4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2016 09:45:56 -0400
In-Reply-To: <20160722224317.GB1594@imap.1und1.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, thomas.petazzoni@free-electrons.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On July 23, 2016 12:45:23 AM Andreas Klinger <ak@it-klinger.de> wrote:

> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> schrieb am Fri, 22. 
> Jul 18:59:
>> On 16.07.2016 17:07, Andreas Klinger wrote:
>> >On Marvell mv88f6180 with pin control driver one can not use multi
>> >purpose pins 35 through 44.
>> >I'm using this controller on an embedded board and i found that the
>> >pin multiplexing is not the same as in the hardware spezification.
>> >This patch alters the pin description so that mpp pins 0 to 19 as well
>> >as 35 to 44 are usable.
>> >
>> >Pin settings i used can be found here:
>> >http://www.marvell.com/embedded-processors/kirkwood/assets/HW_88F6180_OpenSource.pdf
>>
>> Hi Andreas,
>>
>> sorry for the delay. I double-checked the HW datasheet above and can
>> confirm that 6180 uses MPP[19:0] and MPP[44:35], i.e. there is a hole
>> in the middle.
>>
>> So, looking at your patch, you basically move MPP[n] to MPP[n+15]
>> starting with MPP[20] to match the HW spec.
>>
>> That's fine with me, if it works on 6180 Kirkwood.
>
> Hi Sebastian,
>
> i've testet pins 41, 42, 43 and 44 on a real hardware.

Ok. Thanks for the confirmation.

However, I thought about it an realized that
we probably copied the 6180 table from the
old platform driver pre-dating pinctrl-API.

That is why for 6180 there is no hole as gpios
had to be continuous back then.

I cannot check right now, but if we already have
a mainlined board dtb with 6180 we have to
update that as well. If not, the change is
painless.

>>
>> >Signed-off-by: Andreas Klinger <ak@it-klinger.de>
>>
>> Reviewed-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>>
>> And we should probably have a Fixes: tag + stable.

I now think we don't need a fixed tag and it
should not go to stable. It is probably the
first time anyone uses DT pinctrl-API for 6180.

Sebastian


>>
>> Sebastian
>>
>> >---
>> >  drivers/pinctrl/mvebu/pinctrl-kirkwood.c | 85 
>> ++++++++++++++++----------------
>> >  1 file changed, 43 insertions(+), 42 deletions(-)
>> >
>> >diff --git a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c 
>> b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
>> >index a78e9a4..5f89c26 100644
>> >--- a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
>> >+++ b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
>> >@@ -168,87 +168,87 @@ static struct mvebu_mpp_mode mv88f6xxx_mpp_modes[] = {
>> >  		MPP_VAR_FUNCTION(0x0, "gpo", NULL,       V(1, 1, 1, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "nand", "io1",     V(1, 1, 1, 1, 1, 1))),
>> >  	MPP_MODE(20,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp0",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "tx0ql",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "txd0",     V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "spdifi", V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x5, "sata1", "act",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d0",       V(0, 0, 0, 0, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0xc, "mii", "rxerr",    V(1, 0, 0, 0, 0, 0))),
>> >+		MPP_VAR_FUNCTION(0xc, "mii", "rxerr",    V(0, 0, 0, 0, 0, 0))),
>> >  	MPP_MODE(21,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp1",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "rx0ql",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "txd1",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "spdifi", V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "spdifi", V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "spdifo", V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x5, "sata0", "act",    V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d1",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(22,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp2",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "tx2ql",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "txd2",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "spdifo", V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "spdifo", V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "rmclk",  V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x5, "sata1", "prsnt",  V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d2",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(23,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp3",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "rx2ql",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "txd3",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "rmclk",  V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "rmclk",  V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "bclk",   V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x5, "sata0", "prsnt",  V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d3",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(24,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp4",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-cs0",  V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "rxd0",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "bclk",   V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "bclk",   V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "sdo",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d4",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(25,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp5",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-sck",  V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "rxd1",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "sdo",    V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "sdo",    V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "lrclk",  V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d5",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(26,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp6",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-miso", V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "rxd2",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "lrclk",  V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "lrclk",  V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "mclk",   V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d6",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(27,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp7",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-mosi", V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "rxd3",     V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "mclk",   V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "mclk",   V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "sdi",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d7",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(28,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp8",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "int",      V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "col",      V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "sdi",    V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "sdi",    V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0x4, "audio", "extclk", V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d8",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(29,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp9",       V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "rst",      V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "txclk",    V(0, 1, 1, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "extclk", V(1, 0, 0, 0, 0, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "extclk", V(0, 0, 0, 0, 0, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d9",       V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(30,
>> >  		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 0)),
>> >@@ -280,65 +280,65 @@ static struct mvebu_mpp_mode mv88f6xxx_mpp_modes[] = {
>> >  		MPP_VAR_FUNCTION(0x5, "sata1", "act",    V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d14",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(35,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 1, 1, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 1, 1, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "tx0ql",    V(0, 0, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x3, "ge1", "rxerr",    V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x5, "sata0", "act",    V(0, 1, 1, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d15",      V(0, 0, 0, 0, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0xc, "mii", "rxerr",    V(0, 1, 1, 1, 1, 0))),
>> >+		MPP_VAR_FUNCTION(0xc, "mii", "rxerr",    V(1, 1, 1, 1, 1, 0))),
>> >  	MPP_MODE(36,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp0",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-cs1",  V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "spdifi", V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "spdifi", V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "twsi1", "sda",    V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(37,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp1",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "tx2ql",    V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "spdifo", V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "spdifo", V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "twsi1", "sck",    V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(38,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp2",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "rx2ql",    V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "rmclk",  V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "rmclk",  V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d18",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(39,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp3",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-cs0",  V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "bclk",   V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "bclk",   V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d19",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(40,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp4",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-sck",  V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "sdo",    V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "sdo",    V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d20",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(41,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp5",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-miso", V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "lrclk",  V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "lrclk",  V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d21",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(42,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp6",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "spi-mosi", V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "mclk",   V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "mclk",   V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d22",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(43,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp7",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "int",      V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "sdi",    V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "sdi",    V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "d23",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(44,
>> >-		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >+		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(1, 0, 0, 1, 1, 1)),
>> >  		MPP_VAR_FUNCTION(0x1, "ts", "mp8",       V(0, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0x2, "tdm", "rst",      V(0, 0, 0, 1, 1, 0)),
>> >-		MPP_VAR_FUNCTION(0x4, "audio", "extclk", V(0, 0, 0, 1, 1, 0)),
>> >+		MPP_VAR_FUNCTION(0x4, "audio", "extclk", V(1, 0, 0, 1, 1, 0)),
>> >  		MPP_VAR_FUNCTION(0xb, "lcd", "clk",      V(0, 0, 0, 0, 1, 0))),
>> >  	MPP_MODE(45,
>> >  		MPP_VAR_FUNCTION(0x0, "gpio", NULL,      V(0, 0, 0, 1, 1, 1)),
>> >@@ -371,11 +371,12 @@ static struct mvebu_mpp_mode mv88f6xxx_mpp_modes[] = {
>> >  };
>> >
>> >  static struct mvebu_mpp_ctrl mv88f6180_mpp_controls[] = {
>> >-	MPP_FUNC_CTRL(0, 29, NULL, kirkwood_mpp_ctrl),
>> >+	MPP_FUNC_CTRL(0, 44, NULL, kirkwood_mpp_ctrl),
>> >  };
>> >
>> >  static struct pinctrl_gpio_range mv88f6180_gpio_ranges[] = {
>> >-	MPP_GPIO_RANGE(0, 0, 0, 30),
>> >+	MPP_GPIO_RANGE(0,  0,  0, 20),
>> >+	MPP_GPIO_RANGE(1, 35, 35, 10),
>> >  };
>> >
>> >  static struct mvebu_mpp_ctrl mv88f619x_mpp_controls[] = {
>> >
>>


