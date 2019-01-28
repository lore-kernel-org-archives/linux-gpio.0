From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC V2 0/4] pinctrl: bcm2835: improve libgpiod output
Date: Mon, 28 Jan 2019 10:23:35 +0100
Message-ID: <1363edbf-51cf-54d4-e2a2-79ee4c3e501b@i2se.com>
References: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
 <CACRpkdb1fUYz+a9QrO_jEcKgMNJO3ApZAVDR0gqz_Hd=WVQ35g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb1fUYz+a9QrO_jEcKgMNJO3ApZAVDR0gqz_Hd=WVQ35g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Eric Anholt <eric@anholt.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Am 28.01.19 um 09:06 schrieb Linus Walleij:
> On Mon, Jan 21, 2019 at 8:11 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
>> Based on a recent discussion [1],[2] about the unexpected output of gpioinfo
>> this patch series tries to improve the situation. Patches 1-3 are specific
>> changes for bcm2835 while the last one is the intended improvement for gpiolib.
>>
>> Changes in V2:
>> - take strict mode into account as suggested by Linus
>> - add bcm2835 specific changes
> Ooops started to apply this but now I noticed it's in RFC state so I
> backed them out and wait for a non-RFC version first.

i will split this series and resend the non-controversial part (Patch 1+2).

Stefan

>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
