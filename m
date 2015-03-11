From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] gpio / ACPI: Use local variable instead of
 ACPI_HANDLE()
Date: Wed, 11 Mar 2015 10:43:53 +0200
Message-ID: <20150311084353.GE1563@lahna.fi.intel.com>
References: <4032246.STUT1iRmIk@vostro.rjw.lan>
 <15697166.UNaCUJRTg5@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:60374 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751702AbbCKIn4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 11 Mar 2015 04:43:56 -0400
Content-Disposition: inline
In-Reply-To: <15697166.UNaCUJRTg5@vostro.rjw.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>

On Tue, Mar 10, 2015 at 11:10:01PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> In acpi_gpiochip_request_interrupts() the handle local
> variable already contains the value that we want to pass
> to acpi_walk_resources(), so it is better to use that
> variable instead of evaluating ACPI_HANDLE() once more
> for the same device.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
