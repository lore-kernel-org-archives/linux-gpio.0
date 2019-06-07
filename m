From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ns2: Fix potential NULL dereference
Date: Fri, 7 Jun 2019 23:06:27 +0200
Message-ID: <CACRpkdYYYxCti4zRzF1bG+cb+NAONVjg1ynOww5DpG7dzi1B6w@mail.gmail.com>
References: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Young Xiao <92siuyang@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 4:42 AM Young Xiao <92siuyang@gmail.com> wrote:

> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
>
> Signed-off-by: Young Xiao <92siuyang@gmail.com>

Patch applied with Ray's ACK.

Yours,
Linus Walleij
