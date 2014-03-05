From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpio: clamp returned values to the boolean range
Date: Tue, 04 Mar 2014 19:09:19 -0800
Message-ID: <1393988959.3271.37.camel@joe-AO722>
References: <1393378800-7220-1-git-send-email-acourbot@nvidia.com>
	 <CACRpkdY-oBdxxWhsGraEU31qyu+RWJAiRA+KEip6QNW3jRwGUA@mail.gmail.com>
	 <1393985087.3271.21.camel@joe-AO722>
	 <CAAVeFuJdg-p4K1wdLpdv3byiEBUezGGUVjyScoOaZcLZxhPk7A@mail.gmail.com>
	 <1393985959.3271.25.camel@joe-AO722>
	 <CAAVeFuKwLJ5-Q1_u4e_o6tp1F-AKaVQG0ph1GdqjBqFiMCQvPQ@mail.gmail.com>
	 <CACRpkdbaLy+uY_fsht=Fk0qPdtAnttpOK3xrpirPbwB0mA+TPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay0169.hostedemail.com ([216.40.44.169]:42417 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754396AbaCEDJX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Mar 2014 22:09:23 -0500
In-Reply-To: <CACRpkdbaLy+uY_fsht=Fk0qPdtAnttpOK3xrpirPbwB0mA+TPQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 2014-03-05 at 10:33 +0800, Linus Walleij wrote:
> the local "value" variable in the function should still be
> converted to a bool as well right? And the assignment should still
> be "false" not 0. So I would still add my hunk of code...

No idea.  I don't know the code, just wanted to point
out that a bool is not an int.

Generically, I think converting an int to a bool in
any "raw" function probably isn't the right thing to do.

Especially if any of these GPIOs are ever used as ports
(aggregates) in any access.

