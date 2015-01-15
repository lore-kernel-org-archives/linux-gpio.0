From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: gpio-dln2: Added a Blank line after declaration
Date: Thu, 15 Jan 2015 19:10:32 +0100
Message-ID: <20150115181032.GD30960@localhost>
References: <1421161778-5671-1-git-send-email-md.jamalmohiuddin@gmail.com>
 <CACRpkdb2=YyVtFFMqMQrWCVFhtnBOdmw57W0tktYn1c2fS8uQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:41753 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104AbbAOSKX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jan 2015 13:10:23 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb2=YyVtFFMqMQrWCVFhtnBOdmw57W0tktYn1c2fS8uQw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mohammad Jamal <md.jamalmohiuddin@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 15, 2015 at 06:20:43PM +0100, Linus Walleij wrote:
> On Tue, Jan 13, 2015 at 4:09 PM, Mohammad Jamal
> <md.jamalmohiuddin@gmail.com> wrote:
> 
> > Fix the coding style issue by adding a blank line after declaration
> >
> > Signed-off-by: Mohammad Jamal <md.jamalmohiuddin@gmail.com>
> 
> Patch applied.

This one looks bogus; it's adding a random newline within the
declarations not after.

Johan
