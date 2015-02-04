From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Configure HiZ pins to be input when
 requested as GPIOs
Date: Wed, 4 Feb 2015 10:01:49 +0100
Message-ID: <CACRpkdYBnE18CJ6DZDnRQxJi9XEpVdE3UTcAqwCgrb8ewPR3jQ@mail.gmail.com>
References: <1422528288-84076-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:56240 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932981AbbBDJBu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Feb 2015 04:01:50 -0500
Received: by mail-oi0-f50.google.com with SMTP id h136so290878oig.9
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2015 01:01:49 -0800 (PST)
In-Reply-To: <1422528288-84076-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jerome Blin <jerome.blin@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 29, 2015 at 11:44 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> If the pin is in HiZ mode when it is requested as GPIO its value cannot be
> read (it always returns 0). In order to cope with the Linux GPIO subsystem
> where we do not have such state at all, turn the pin to be input instead.
>
> Reported-by: Jerome Blin <jerome.blin@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Since putting a pin into GPIO mode start poking around in essentially pin
control registers, we may need to revisit the issue of the pin control subsystem
not denying simultaneous use of a pin for a device muxing and GPIO.
Maybe the "strict" setting forcing a pin to be either one or the other on
a per-driver basis would enforce a better policy on this driver (and some
others).

Yours,
Linus Walleij
