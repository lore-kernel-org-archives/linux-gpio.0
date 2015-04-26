From: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: configure SPI SSx pins separately
Date: Sun, 26 Apr 2015 11:14:10 +0200
Message-ID: <553CAC62.7060208@gmail.com>
References: <1429694097-3087-1-git-send-email-helmut.buchsbaum@gmail.com> <c8981060-7f8d-4d0c-bc4f-c7be8f5ce02c@BY2FFO11FD032.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:33414 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410AbbDZJON (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Apr 2015 05:14:13 -0400
Received: by wgin8 with SMTP id n8so88403038wgi.0
        for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2015 02:14:12 -0700 (PDT)
In-Reply-To: <c8981060-7f8d-4d0c-bc4f-c7be8f5ce02c@BY2FFO11FD032.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org

On 04/24/2015 08:21 PM, S=C3=B6ren Brinkmann wrote:
> Hi Helmut,
>
> On Wed, 2015-04-22 at 11:14AM +0200, Helmut Buchsbaum wrote:
>   =20
>> Since SCLK, MISO and MOSI are the only mandatory signals at Zynq's S=
PI
>> interfaces, SS0, SS1 and SS2 have to be configured separately as the=
y may
>> be used as simple GPIO lines.
>>
>> This, of course, has to be considered in the devicetree, so pin cont=
roller
>> configuration for e.g. an SPI0 using SS0 and SS1 only might look lik=
e the
>> following snippet (derived from the example of chapter "17.5.3
>> MIO/EMIO" Routing of Zynq-7000 TRM UG585). So MIO20 can now be used
>> as GPIO instead of being occupied by SPI0 SS2 function:
>>     =20
> I think this is very valid and correct. Thanks! One doubt I have thou=
gh:
> [...]
>   =20
>> @@ -548,10 +591,20 @@ static const char * const qspi0_groups[] =3D {=
"qspi0_0_grp"};
>>   static const char * const qspi1_groups[] =3D {"qspi0_1_grp"};
>>   static const char * const qspi_fbclk_groups[] =3D {"qspi_fbclk_grp=
"};
>>   static const char * const qspi_cs1_groups[] =3D {"qspi_cs1_grp"};
>> -static const char * const spi0_groups[] =3D {"spi0_0_grp", "spi0_1_=
grp",
>> -					   "spi0_2_grp"};
>> -static const char * const spi1_groups[] =3D {"spi1_0_grp", "spi1_1_=
grp",
>> -					   "spi1_2_grp", "spi1_3_grp"};
>> +static const char * const spi0_groups[] =3D {"spi0_0_grp", "spi0_0_=
ss0_grp",
>> +					   "spi0_0_ss1_grp", "spi0_0_ss2_grp",
>> +					   "spi0_1_grp", "spi0_1_ss0_grp",
>> +					   "spi0_1_ss1_grp", "spi0_1_ss2_grp",
>> +					   "spi0_2_grp", "spi0_2_ss0_grp",
>> +					   "spi0_2_ss1_grp", "spi0_2_ss2_grp"};
>> +static const char * const spi1_groups[] =3D {"spi1_0_grp", "spi1_0_=
ss0_grp",
>> +					   "spi1_0_ss1_grp", "spi1_0_ss2_grp",
>> +					   "spi1_1_grp", "spi1_1_ss0_grp",
>> +					   "spi1_1_ss1_grp", "spi1_1_ss2_grp",
>> +					   "spi1_2_grp", "spi1_2_ss0_grp",
>> +					   "spi1_2_ss1_grp", "spi1_2_ss2_grp",
>> +					   "spi1_3_grp", "spi1_3_ss0_grp",
>> +					   "spi1_3_ss1_grp", "spi1_3_ss2_grp"};
>>     =20
> Can we add this to the spiX groups or do we need individual
> spix_ss_groups[] arrays? E.g. for the SD card detect signal and simil=
ar
> we have individual groups arrays.
>
> 	S=C3=B6ren
>   =20

You're right. The cleaner solution is to keep the slave select groups i=
n=20
separate spix_ss_groups[] arrays. This also results in additional=20
spix_ss pinmux functions. As a result this will be rather similar to th=
e=20
PC, WP and CD signals for SDIO. I'll change that and rework my patch.

Thanks,
Helmut

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
