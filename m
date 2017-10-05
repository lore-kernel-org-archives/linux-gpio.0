From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] gpio: rcar: Use of_device_get_match_data() helper
Date: Thu, 5 Oct 2017 11:15:20 +0200
Message-ID: <20171005091519.GM26369@verge.net.au>
References: <1507119376-12491-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507119376-12491-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 04, 2017 at 02:16:16PM +0200, Geert Uytterhoeven wrote:
> Use the of_device_get_match_data() helper instead of open coding.
> Note that the gpio-rcar driver is used with DT only, so there's always a
> valid match.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
