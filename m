From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: gpio: mention that <function>-gpio has
 been deprecated
Date: Thu, 24 Sep 2015 15:56:29 -0600
Message-ID: <20150924155629.5bd29990@lwn.net>
References: <1442841286-8586-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1442841286-8586-1-git-send-email-javier@osg.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, 21 Sep 2015 15:14:46 +0200
Javier Martinez Canillas <javier@osg.samsung.com> wrote:

> The gpiolib supports parsing DT properties of the form <function>-gpio
> but it was only added for compatibility with older DT bindings that got
> it wrong and should not be used in newer bindings.
> 
> The commit that added support for this was:
> 
> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
> 
> but didn't update the documentation to explain this so it's been a source
> of confusion. So let's make clear this in the GPIO documentation.

Applied to the docs tree, thanks.

jon
