From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Wed, 23 Mar 2016 09:25:20 -0400
Message-ID: <CACPiFC+8HeihK6w81e=EbQNVRiGiYXkr96UJRV3es0hhqDsRkQ@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com> <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com> <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com> <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com> <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
 <CACPiFCL2rc-yMht2_CyPgLg35xamDobhzQVJjDed4FgpbX9gTA@mail.gmail.com> <20160323111302.GJ2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33552 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755139AbcCWN0U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2016 09:26:20 -0400
Received: by mail-oi0-f44.google.com with SMTP id d205so19253136oia.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2016 06:26:20 -0700 (PDT)
In-Reply-To: <20160323111302.GJ2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Mar 23, 2016 at 7:13 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Does it work if you have only pictrl-cherryview blacklisted? E.g no
> noapic?

Does not work. To complete boot, I met have noapic and
pinctrl_cherryview blacklisted.

> You can also disable the HS-UART as it tries to divide by zero:
>
> CONFIG_SERIAL_8250_DW=n

Heh, dividing by zero is always a good try.


m
-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff
