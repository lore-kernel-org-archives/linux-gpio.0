From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][next] pinctrl: intel: ensure error return ret is initialized
Date: Thu, 7 Dec 2017 09:58:53 +0100
Message-ID: <CACRpkdY7maQih6iYze5BbZRsAHW+s+SENVnsbA5QenLKSbpAzg@mail.gmail.com>
References: <20171204170815.14779-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171204170815.14779-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 4, 2017 at 6:08 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> In the (unlikely) event that community->ngpps is zero, or if every
> gpp->gpio_base is less than zero, then an ininitialized value in
> ret is returned by function intel_gpio_add_pin_ranges. Fix this by
> ensuring ret is initialized to zero.  It's a moot point, but I think
> it is worthwhile ensuring this corner case is fixed.
>
> Detected by CoverityScan, CID#1462415 ("Uninitialized scalar variable")
>
> Fixes: a60eac3239f0 ("pinctrl: intel: Allow custom GPIO base for pad groups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Mika's ACK.

Thanks for running these Coverity scans.

Yours,
Linus Walleij
