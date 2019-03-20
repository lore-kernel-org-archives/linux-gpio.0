From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH v2] selftest/gpio: Remove duplicate header
Date: Wed, 20 Mar 2019 11:27:52 +0530
Message-ID: <CAFqt6zbwdPnkQ3YrrcELzAHuMFxvKsf=xg62Qj-056T03ThRQQ@mail.gmail.com>
References: <20190306162018.GA3187@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306162018.GA3187@jordon-HP-15-Notebook-PC>
Sender: linux-kernel-owner@vger.kernel.org
To: Bamvor Zhang <bamv2005@gmail.com>, shuah <shuah@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kselftest <linux-kselftest@vger.kernel.org>, linux-kernel@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 6, 2019 at 9:45 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
>
> Remove duplicate header which are included twice.
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
> v2: Corrected format.

Any comment on this patch ?

>
>  tools/testing/selftests/gpio/gpio-mockup-chardev.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> index aaa1e9f..d587c81 100644
> --- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> +++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> @@ -12,7 +12,6 @@
>  #include <unistd.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -#include <stdio.h>
>  #include <errno.h>
>  #include <string.h>
>  #include <fcntl.h>
> --
> 1.9.1
>
