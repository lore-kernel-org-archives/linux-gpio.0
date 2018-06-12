From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix wrong rounding in gpio-menz127
Date: Tue, 12 Jun 2018 10:40:22 +0200
Message-ID: <CACRpkdbqDKAkxjY1NsUpJ=UR0MVGivUdQz+BE-7MXXjZYa04bw@mail.gmail.com>
References: <20180604135814.101343-1-namit@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180604135814.101343-1-namit@vmware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nadav Amit <namit@vmware.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 4, 2018 at 3:58 PM, Nadav Amit <namit@vmware.com> wrote:

> men_z127_debounce() tries to round up and down, but uses functions which
> are only suitable when the divider is a power of two, which is not the
> case. Use the appropriate ones.
>
> Found by static check. Compile tested.
>
> Fixes: f436bc2726c64 ("gpio: add driver for MEN 16Z127 GPIO controller")
>
> Signed-off-by: Nadav Amit <namit@vmware.com>

Applied as a non-critical fix as I have not error reports.

Yours,
Linus Walleij
