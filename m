From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] gpio: board.txt: Fix the gpio name example
Date: Wed, 28 Jan 2015 11:14:48 -0700
Message-ID: <20150128111448.5c2a2605@lwn.net>
References: <1422318639-20995-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:35232 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754041AbbA1U1a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 28 Jan 2015 15:27:30 -0500
In-Reply-To: <1422318639-20995-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

On Mon, 26 Jan 2015 22:30:39 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> As explained in this file:
> 
> "GPIOs mappings are defined in the consumer device's node, in a property named
> <function>-gpios"
> 
> So fix the example to match the convention.

OK, I've applied this to the docs tree, thanks.

jon
