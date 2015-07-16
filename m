From: Rabin Vincent <rabin@rab.in>
Subject: Re: [RFT PATCH] gpio: etraxfs: Fix devm_ioremap_resource return
 value check
Date: Thu, 16 Jul 2015 19:36:58 +0200
Message-ID: <20150716173658.GA1824@debian>
References: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 09, 2015 at 10:19:53PM +0900, Krzysztof Kozlowski wrote:
> Value returned by devm_ioremap_resource() was checked for non-NULL but
> devm_ioremap_resource() returns IOMEM_ERR_PTR, not NULL. In case of
> error this could lead to dereference of ERR_PTR.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> Fixes: d342571efea8 ("gpio: add ETRAXFS GPIO driver")

Acked-by: Rabin Vincent <rabin@rab.in>

> Cc: <stable@vger.kernel.org>

I don't think this demands a stable backport though.
