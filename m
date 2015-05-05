From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio driver for NXP LPC18xx family
Date: Tue, 5 May 2015 17:58:29 +0200
Message-ID: <CACRpkdZ9oqsh67-J3imL_tsQxiGfr7O_N82N-SUVmju7cmyb9w@mail.gmail.com>
References: <1430601095-31984-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1430601095-31984-1-git-send-email-manabian@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, May 2, 2015 at 11:11 PM, Joachim Eastwood <manabian@gmail.com> wrote:

> This patch set adds a gpio driver for NXP LPC18xx/43xx devices.
> Patchset is based on Linus master 4.1-rc1.
>
> changes in v2:
>  - use PBYTE register for gpio set/get
>  - refactor direction setup
>  - add lock for direction set RMW cycle
>  - expand doc example

This v2 version applied.

Yours,
Linus Walleij
