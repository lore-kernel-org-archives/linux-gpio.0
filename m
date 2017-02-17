From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH v2] gpio: dwapb: Add support for next generation of
 X-Gene SoC
Date: Fri, 17 Feb 2017 09:49:34 +0000
Message-ID: <20170217094934.GB30801@page>
References: <1487293289-9807-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487293289-9807-1-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Weike Chen <alvin.chen@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lho@apm.com, Duc Dang <dhdang@apm.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2017 at 05:01:29PM -0800, Hoan Tran wrote:
> Next generation of X-Gene SoC's GPIO hardware register map is very
> similar to DW GPIO. It only differs by a few register addresses.
> This patch modifies DW GPIO driver to accommodate the difference
> in a few register addresses.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>

Reviewed-by: Jamie Iles <jamie@jamieiles.com>
