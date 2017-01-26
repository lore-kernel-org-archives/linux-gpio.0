From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: aspeed: Make bank names strings
Date: Thu, 26 Jan 2017 14:32:13 +0100
Message-ID: <CACRpkdbhtbcJWQ5kA-iyjMfUdDnGDr2DyH_sZBon19T1rWryPw@mail.gmail.com>
References: <20170123052607.9424-1-andrew@aj.id.au> <20170123052607.9424-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123052607.9424-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2017 at 6:26 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
> documentation uses two letter names such as AA and AB, so make the names
> a three-character array in the bank struct to accommodate this.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
