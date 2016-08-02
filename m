From: Helmut Grohne <h.grohne@intenta.de>
Subject: Re: [PATCH 4.6 69/81] gpio: zynq: initialize clock even without
 CONFIG_PM
Date: Tue, 2 Aug 2016 12:58:05 +0200
Message-ID: <20160802105805.GA25787@laureti-dev>
References: <20160622223743.240652686@linuxfoundation.org>
 <20160622223746.777833462@linuxfoundation.org>
 <CAKfKVtEFF=PvZ62N-Re9BX4iq+pCK5qchbp7N3TworkpRkAZZQ@mail.gmail.com>
 <20160721105754.GA5086@laureti-dev>
 <CAKfKVtGedpeOYYaxO4JMoxHeLep5o8C4md1quAsUVQo0vvEtAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.intenta.de ([194.31.246.158]:47727 "EHLO mail.intenta.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcHBK6v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Aug 2016 06:58:51 -0400
Content-Disposition: inline
In-Reply-To: <CAKfKVtGedpeOYYaxO4JMoxHeLep5o8C4md1quAsUVQo0vvEtAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

On Tue, Aug 02, 2016 at 10:59:05AM +0200, Shubhrajyoti Datta wrote:
> I feel that if you can print the clk enable count in at boot things
> could be easy
> to understand.

I verifed this via two ways now (holds both for CONFIG_PM=y and
CONFIG_PM=n):

 * zynq_gpio_runtime_resume is not called (as expected given my
   analysis). I simply added a printk to check that.
 * After boot, /sys/kernel/debug/clk/gpio_aper/clk_enable_count also
   confirms my analysis by yielding "1".

Thus I conclude that there there is no bug. Neither in theory nor in
practise.

Helmut
