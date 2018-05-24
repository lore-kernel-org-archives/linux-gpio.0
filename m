From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: Remove VLA from stmpe driver
Date: Thu, 24 May 2018 10:23:14 +0200
Message-ID: <CACRpkdZWtdePWwGZ=1w_8CTz3STt+cVJv7hQAigYHFi1gm6fKA@mail.gmail.com>
References: <20180328175957.23904-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328175957.23904-1-labbott@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Patrice Chotard <patrice.chotard@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-hardening@lists.openwall.com
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 28, 2018 at 7:59 PM, Laura Abbott <labbott@redhat.com> wrote:

> The new challenge is to remove VLAs from the kernel
> (see https://lkml.org/lkml/2018/3/7/621)
>
> The number of GPIOs on the supported chips is fairly small
> so stack allocate to a known upper bound and spit out a warning
> if any new chips have more gpios.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Patch applied with the review tags!

Yours,
Linus Walleij
