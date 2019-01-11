From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT][PATCH] gpio: sama5d2-piobu: Set proper output level for
 direction_output
Date: Fri, 11 Jan 2019 10:35:32 +0100
Message-ID: <CACRpkdYT8eb2PD2fOvHo7MsSi7Ltqjbjk=udnKsW-q2YSFcGUQ@mail.gmail.com>
References: <20181231095256.14814-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181231095256.14814-1-axel.lin@ingics.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andrei Stefanescu <andrei.stefanescu@microchip.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 31, 2018 at 10:53 AM Axel Lin <axel.lin@ingics.com> wrote:

> Set proper output level base on the argument of direction_output.
> Also remove sama5d2_piobu_set_direction() as there is only one caller
> now.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch tentatively applied as non-critical fix (for v5.1) unless
Andrei has concerns.

Yours,
Linus Walleij
