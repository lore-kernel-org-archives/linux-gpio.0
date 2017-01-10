From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools: gpio add .gitignore for generated files
Date: Tue, 10 Jan 2017 10:29:08 +0100
Message-ID: <CACRpkdbeT8PgxW+VCGwrznOTQV=2Dw8CcJUqZAcKdB2a96tJXA@mail.gmail.com>
References: <20170105213236.15562-1-shuahkh@osg.samsung.com> <20170105213236.15562-5-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170105213236.15562-5-shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 5, 2017 at 10:32 PM, Shuah Khan <shuahkh@osg.samsung.com> wrote:

> Add .gitignore for generated files.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/gpio/.gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 tools/gpio/.gitignore
>
> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> new file mode 100644
> index 0000000..767ad24
> --- /dev/null
> +++ b/tools/gpio/.gitignore
> @@ -0,0 +1,4 @@
> +gpio-event-mon
> +gpio-hammer
> +lsgpio
> +include

I understand the first three.

But "include"?
How did you produce that?

Yours,
Linus Walleij
