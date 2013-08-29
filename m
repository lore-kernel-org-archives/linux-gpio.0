From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3] gpio: add GPIO support for F71882FG and F71889F
Date: Thu, 29 Aug 2013 23:22:19 +0100
Message-ID: <20130829222219.GA24221@srcf.ucam.org>
References: <1374486633-9737-1-git-send-email-simon.guinot@sequanux.org>
 <CACRpkda2bH_TkFR6c0cXvjye4SmFWN5xuzQSO=NqBq8mNDgV0g@mail.gmail.com>
 <20130801134632.GY9916@kw.sim.vm.gnt>
 <CACRpkdZcEPM-u19pc+v_cRqUSfJBFZ49rJYiewQ1sWWSU5YxEg@mail.gmail.com>
 <20130829125754.GA8813@srcf.ucam.org>
 <521F4F95.5080103@roeck-us.net>
 <20130829153738.GA16306@srcf.ucam.org>
 <20130829160830.GB25021@roeck-us.net>
 <20130829162551.GA17411@srcf.ucam.org>
 <20130829222053.GE13942@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57688 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756292Ab3H2WWZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 18:22:25 -0400
Content-Disposition: inline
In-Reply-To: <20130829222053.GE13942@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "H. Peter Anvin" <hpa@linux.intel.com>

On Fri, Aug 30, 2013 at 12:20:54AM +0200, Simon Guinot wrote:

> Almost all the LaCie NASes are running a Linux based OS. I can assure
> you that LaCie really takes care of Linux. Now, the main reason why the
> Super-I/O ACPI support is missing on this boards is a lack of knowledge.
> Thanks to this discussion, I am now aware of that. Then, for the next
> products, I will do my best to get AMLs or at least ACPI IDs.

Awesome! Let me know if you need any advice on this.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
