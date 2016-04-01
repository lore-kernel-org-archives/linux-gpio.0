From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: Use correct u16 value for register word write
Date: Fri, 1 Apr 2016 14:51:14 +0200
Message-ID: <CACRpkdZ9ojn1rhbX8v9zJ8srkQWrQzSZZ6BLYiyyQwU3oz5BTQ@mail.gmail.com>
References: <1459320554-2455-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459320554-2455-1-git-send-email-sdliyong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexander Stein <alexander.stein@systec-electronic.com>, Phil Reid <preid@electromag.com.au>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 30, 2016 at 8:49 AM, Yong Li <sdliyong@gmail.com> wrote:

> The current implementation only uses the first byte in val,
> the second byte is always 0. Change it to use cpu_to_le16
> to write the two bytes into the register
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>

Patch applied to fixes with Phil's review tag.

It is a regression, right?

Should it be tagged for stable?

Yours,
Linus Walleij
