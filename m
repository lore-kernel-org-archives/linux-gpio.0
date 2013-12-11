From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v4] gpio: add GPIO support for SMSC SCH311x
Date: Wed, 11 Dec 2013 22:10:55 +0000
Message-ID: <20131211221055.GA30589@srcf.ucam.org>
References: <1386201717-25815-1-git-send-email-br1@einfach.org>
 <CACRpkdb0z9GgLVhYESJ8NyEZXTXctpyHjrA6dC3A0wn+X7fnGw@mail.gmail.com>
 <20131211191639.GA26416@srcf.ucam.org>
 <52A8D5A3.8020401@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60894 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab3LKWLE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 17:11:04 -0500
Content-Disposition: inline
In-Reply-To: <52A8D5A3.8020401@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Wed, Dec 11, 2013 at 09:14:11PM +0000, Bruno Randolf wrote:
> On 12/11/2013 07:16 PM, Matthew Garrett wrote:
> > Bruno, do you have an acpidump for a machine with one of these chips?
> 
> I'll try to get one in the next couple of days, but unfortunately I
> don't have direct access to the machine anymore.
> 
> What exatly do you need? Will "cat /sys/firmware/acpi/tables/DSDT >
> dsdt.dat" suffice? Anything else?

That plus any SSDT files in /sys/firmware/acpi/tables or tables/dynamic.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
