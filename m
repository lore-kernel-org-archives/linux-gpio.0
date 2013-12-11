From: Bruno Randolf <br1@einfach.org>
Subject: Re: [PATCH v4] gpio: add GPIO support for SMSC SCH311x
Date: Wed, 11 Dec 2013 21:14:11 +0000
Message-ID: <52A8D5A3.8020401@einfach.org>
References: <1386201717-25815-1-git-send-email-br1@einfach.org> <CACRpkdb0z9GgLVhYESJ8NyEZXTXctpyHjrA6dC3A0wn+X7fnGw@mail.gmail.com> <20131211191639.GA26416@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:41714 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917Ab3LKVOU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 16:14:20 -0500
In-Reply-To: <20131211191639.GA26416@srcf.ucam.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On 12/11/2013 07:16 PM, Matthew Garrett wrote:
> Bruno, do you have an acpidump for a machine with one of these chips?

I'll try to get one in the next couple of days, but unfortunately I
don't have direct access to the machine anymore.

What exatly do you need? Will "cat /sys/firmware/acpi/tables/DSDT >
dsdt.dat" suffice? Anything else?

bruno

