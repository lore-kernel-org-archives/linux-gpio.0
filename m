From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: Set proper argument value to set_config
Date: Thu, 4 Apr 2019 11:56:07 +0700
Message-ID: <CACRpkdYzkz6wa9fzFGsYkCroVb9tSewQisCtDx51Fiz7VF6PBQ@mail.gmail.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <b9ed544722175ea00b1f6ecb29ca5c3e1322239f.1552591798.git-series.maxime.ripard@bootlin.com>
 <CACRpkdaRofnaN5RMqRyyAakngyCWBKQX8+y32SESiwvVxbFyOA@mail.gmail.com>
 <20190403183644.b25rlkxgquw2aqny@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403183644.b25rlkxgquw2aqny@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 4, 2019 at 1:36 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> > Patch applied to the GPIO tree, I suppose I can merge it there
> > orthogonally to the other patches (the result will be fine).
>
> Yeah, the only drawback I can see is that the configuration will be
> rejected, but since it's going to be merged in fixes, the case where
> we have the driver patches but not that one seems pretty unlikely.

Hm I merged it for devel (next, v5.2) as I don't think there are regressions.
But if Thomas agrees we can put this into fixes instead.

> We have a lot going through our tree for the next release though, so
> ideally we should merge the DT patches through arm-soc.

That should always be fine to do in parallel.

Yours,
Linus Walleij
