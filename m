From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/3] pinctrl/broxton: enable platform device in the
 absent of ACPI enumeration
Date: Thu, 23 Jun 2016 10:42:05 +0200
Message-ID: <CACRpkdaFJV3b5YXwF2S6DNYy45T6LJ=zVtDka69E_43s8yn8sg@mail.gmail.com>
References: <1466485831-20416-1-git-send-email-jui.nee.tan@intel.com> <1466485831-20416-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33603 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbcFWImH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 04:42:07 -0400
Received: by mail-oi0-f51.google.com with SMTP id u201so60067922oie.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 01:42:07 -0700 (PDT)
In-Reply-To: <1466485831-20416-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, Jun 21, 2016 at 7:10 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:

> This is to cater the need for non-ACPI system whereby
> a platform device has to be created in order to bind
> with the Apollo Lake Pinctrl GPIO platform driver.
>
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This patch is already applied in my tree.

Yours,
Linus Walleij
