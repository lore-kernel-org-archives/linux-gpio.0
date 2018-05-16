From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl: msm: fix gpio-hog related boot issues
Date: Wed, 16 May 2018 14:28:17 +0200
Message-ID: <CACRpkdbND_LWJmoH9yPQ2ruorM8CRWVk2S0nd1GCChZ=fuz_Eg@mail.gmail.com>
References: <20180412190138.12372-1-chunkeey@gmail.com>
 <CACRpkdZPEHvnQdwh5Uu5kwqK7yVGTaw_cZR+GOzsG9pg4oEktA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZPEHvnQdwh5Uu5kwqK7yVGTaw_cZR+GOzsG9pg4oEktA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 26, 2018 at 2:03 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Apr 12, 2018 at 9:01 PM, Christian Lamparter <chunkeey@gmail.com> wrote:
>
>> Sven Eckelmann reported an issue with the current IPQ4019 pinctrl.
>> Setting up any gpio-hog in the device-tree for his device would
>> "kill the bootup completely":
(...)
>> Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>
> This patch looks VERY good to me.
>
> I am fine in merging it into pin control including the ranges
> fixes.
>
> I need Andy's and Bjorn's ACKs on it though!
>
> Can you guys provide that?

Hm? Andy, Bjorn?

Seems you guys are a bit snowed under.

I guess I have to just apply it at some point and see what
happens...

Yours,
Linus Walleij
