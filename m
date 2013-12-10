From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 17:05:27 +0000
Message-ID: <20131210170527.GB26978@srcf.ucam.org>
References: <1386116613-5241-1-git-send-email-br1@einfach.org>
 <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:36307 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755120Ab3LJRFb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 12:05:31 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Tue, Dec 10, 2013 at 12:51:30PM +0100, Linus Walleij wrote:

> Matthew is this how discovery and registration of x86 platform
> drivers for port-mapped devices should work or are we doing
> something weird here?

This is pretty awful, but typical. LPC devices *should* be present in 
ACPI to some extent, but often you'll just find (at best) a reference to 
a superIO chip and no child devices. Do we have an example DSDT for a 
device with this part?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
