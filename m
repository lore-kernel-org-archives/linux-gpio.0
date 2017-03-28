From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH 5/6] pinctrl: meson: use gpio-ranges from DT
Date: Tue, 28 Mar 2017 11:30:56 +0200
Message-ID: <CACRpkdZqfwKZ=2SQzr_D5-M5em+7JBS7eUaJ_VH33uV5AZ8xRw@mail.gmail.com>
References: <1490286449-19448-1-git-send-email-narmstrong@baylibre.com>
 <1490286449-19448-6-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490286449-19448-6-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2017 at 5:27 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

'> When trying to add a gpio-hog, we enter a weird loop where the gpio-ranges
> is needed when gpiochip_add_data() is called but in the current implementation
> the ranges are added from the driver afterwards.
>
> A simple solution is to rely on the DR gpio-ranges attribute and remove the
> call to gpiochip_add_pin_range().
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This is fine once the ranges have been applied to the device trees I guess.

Tell me when you want me to merge this.

Yours,
Linus Walleij
