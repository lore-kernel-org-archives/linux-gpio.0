From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v4] gpio: add GPIO support for SMSC SCH311x
Date: Wed, 11 Dec 2013 19:16:39 +0000
Message-ID: <20131211191639.GA26416@srcf.ucam.org>
References: <1386201717-25815-1-git-send-email-br1@einfach.org>
 <CACRpkdb0z9GgLVhYESJ8NyEZXTXctpyHjrA6dC3A0wn+X7fnGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57919 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331Ab3LKTQr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 14:16:47 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb0z9GgLVhYESJ8NyEZXTXctpyHjrA6dC3A0wn+X7fnGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruno Randolf <br1@einfach.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Wed, Dec 11, 2013 at 01:24:34PM +0100, Linus Walleij wrote:
 
> I'm basically happy with this version, but I want to hash out
> a strategy for handling this type of devices with the x86
> platform device maintainer, Matthew, so allow me a few more
> days to think about this.

Bruno, do you have an acpidump for a machine with one of these chips?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
