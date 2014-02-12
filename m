From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: pca953x: Add devices to Kconfig help
Date: Wed, 12 Feb 2014 16:21:29 +0100
Message-ID: <CACRpkdYbeeDi_xRudyyCmi2WLie_jpvhHLKGz5Jbr0a8T1rYLg@mail.gmail.com>
References: <972232456.119003.1391812066467.JavaMail.zimbra@xes-inc.com>
	<1550736903.119527.1391812548072.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:46732 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbaBLPVb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 10:21:31 -0500
Received: by mail-oa0-f43.google.com with SMTP id h16so11112228oag.16
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 07:21:30 -0800 (PST)
In-Reply-To: <1550736903.119527.1391812548072.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Sierra <asierra@xes-inc.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Graeme Smecher <gsmecher@threespeedlogic.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 7, 2014 at 11:35 PM, Aaron Sierra <asierra@xes-inc.com> wrote:

> The pca953x driver supports tca6424 (24-bit) and pca9505 (40-bit)
> devices. They were the only supported devices not mentioned in the
> Kconfig help.
>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Can I get some help from the previous pca953x contributors
to have a look at these new patches? An ACK or similar
would be nice.

Yours,
Linus Walleij
