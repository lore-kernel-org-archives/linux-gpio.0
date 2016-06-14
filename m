From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl/broxton: enable platform device in the
 absent of ACPI enumeration
Date: Tue, 14 Jun 2016 09:08:32 +0200
Message-ID: <CACRpkdbdVNH+3KPHPX6ZytkvHH_-jdc1gja2f9NbEdTq=89aiA@mail.gmail.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com> <1465282553-28396-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33286 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbcFNHId (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 03:08:33 -0400
Received: by mail-oi0-f41.google.com with SMTP id u201so116025531oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2016 00:08:33 -0700 (PDT)
In-Reply-To: <1465282553-28396-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, Jun 7, 2016 at 8:55 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:

> This is to cater the need for non-ACPI system whereby
> a platform device has to be created in order to bind
> with the Apollo Lake Pinctrl GPIO platform driver.
>
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

You forgot to put me on the To: line for the patch so it's only luck that I
saw it. (Every once on a blue moon I read the linux-gpio list directly...)

Patch applied with Mika's ACK.

Yours,
Linus Walleij
