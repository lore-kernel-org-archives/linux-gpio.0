From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: Remove VLA from xra1403 driver
Date: Mon, 26 Mar 2018 11:09:16 +0200
Message-ID: <CACRpkdbahPzpDpruGz3zrGvG-xskjp_YnVAadkqS1iPU=1NAXw@mail.gmail.com>
References: <20180310001021.6437-1-labbott@redhat.com> <20180310001021.6437-4-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180310001021.6437-4-labbott@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Nandor Han <nandor.han@ge.com>, Semi Malinen <semi.malinen@ge.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-hardening@lists.openwall.com
List-Id: linux-gpio@vger.kernel.org

On Sat, Mar 10, 2018 at 1:10 AM, Laura Abbott <labbott@redhat.com> wrote:

> The new challenge is to remove VLAs from the kernel
> (see https://lkml.org/lkml/2018/3/7/621)
>
> This patch replaces a VLA with an appropriate call to kmalloc_array.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Patch applied with Nandor's review tag.

Yours,
Linus Walleij
