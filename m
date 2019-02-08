From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 2/2] pinctrl: bcm2835: Direct GPIO config changes to
 generic pinctrl
Date: Fri, 8 Feb 2019 13:13:30 +0100
Message-ID: <CACRpkdZzywMnP49pyUgobr8YmiyoV6g3Jiq1ft+NEQFnR3gbEA@mail.gmail.com>
References: <1549198954-4711-1-git-send-email-stefan.wahren@i2se.com>
 <1549198954-4711-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549198954-4711-3-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Feb 3, 2019 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> In order to support GPIO config changes direct these to the generic pinctrl.
> This also requires an adjust of the return code for unsupported parameter
> otherwise gpiod_configure_flags wont work as expected.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied.

Yours,
Linus Walleij
