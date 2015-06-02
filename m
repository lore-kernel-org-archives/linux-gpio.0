From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Tue, 2 Jun 2015 15:53:40 +0200
Message-ID: <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
	<20150601092348.GK1747@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34706 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758735AbbFBNxk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 09:53:40 -0400
Received: by obew15 with SMTP id w15so128575982obe.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 06:53:40 -0700 (PDT)
In-Reply-To: <20150601092348.GK1747@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 1, 2015 at 11:23 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, May 22, 2015 at 10:56:08AM +0300, Mika Westerberg wrote:
>> BIOS/platform may use some of the pins by themselves, such as providing SCI
>> (System Control Interrupt) from the embedded controller. The driver masks
>> all interrupts at probe time which prevents those pins from triggering
>> interrupts properly.
>>
>> Fix this by not masking all interrupts at probe -- it should be enough just
>> to clear the status register.
>>
>> Reported-by: Yu C Chen <yu.c.chen@intel.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Please ignore this patch for now. It turned out to be causing spurious
> interrupts on another platform.
>
> I'll need to rethink how to fix the reported issue.

Looks like a case of "embed more magic knowledge" in the driver :/

It needs to know what platform it is running on, and only leave specific
bits unmasked on these specific platforms. Right? Thereby
tossing all of the acpi_device_id matching and abstraction out
of the window.

(Yes, I hate BIOSes doing crap behind my back.)

Yours,
Linus Walleij
