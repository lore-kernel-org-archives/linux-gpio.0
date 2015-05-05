From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/1] pinctrl: at91: Add set_multiple GPIO chip feature
Date: Tue, 5 May 2015 17:16:49 +0200
Message-ID: <CACRpkdY-osqmFqq0N9UuLfvBowjoa8cjORuL0GYMntne7AatHw@mail.gmail.com>
References: <1427968549-19837-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1427968549-19837-1-git-send-email-alexanders83@web.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Stein <alexanders83@web.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 2, 2015 at 11:55 AM, Alexander Stein <alexanders83@web.de> wrote:

> This adds the callback for set_multiple.
> As this controller has a separate set and clear register, we can't write
> directly to PIO_ODSR as this would required a cached variable and would
> race with at91_gpio_set.
> So build masks for the PIO_SODR and PIO_CODR registers and write them
> together.
>
> Signed-off-by: Alexander Stein <alexanders83@web.de>
> ---
> I Just realized that some implementations have less than 32 pins. Thus
> BITS_MASK(chip->ngpio) as suggested by Jean-Christophe is actually required.
> I missed that, sorry for the noise.
>
> Changes in v3:
> * As not all GPIO controllers have 32 pins take ngpio into account
>   Mask the set- and clear-mask to the supported GPIO pins

No more comments on v3 so patch applied for v4.2.

Yours,
Linus Walleij
