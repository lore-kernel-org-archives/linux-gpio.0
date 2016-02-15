From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Tue, 16 Feb 2016 00:13:36 +0100
Message-ID: <CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
References: <20160211120551.4d8224a4@endymion>
	<20160211112317.GT16826@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33301 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcBOXNg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 18:13:36 -0500
Received: by mail-ob0-f178.google.com with SMTP id jq7so48632514obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 15:13:36 -0800 (PST)
In-Reply-To: <20160211112317.GT16826@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>

On Thu, Feb 11, 2016 at 12:23 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Feb 11, 2016 at 12:05:51PM +0100, Jean Delvare wrote:
>> The pinctrl-baytrail driver builds just fine as a module so give
>> users this option.
>
> IIRC the reason why this is built-in is that there are all kind of ACPI
> GPIO magic happening behind the scenes on Baytrail-T based machines
> (such as Asus T100) and it does not work without the GPIO driver. Some
> of the stuff is done pretty early too.

Hm I wonder if that could be the case for the AMD driver that just
got tristated too...

Yours,
Linus Walleij
