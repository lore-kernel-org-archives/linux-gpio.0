From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: pc104: Mask PC/104 drivers via the PC104
 Kconfig option
Date: Tue, 10 Jan 2017 16:45:35 -0500
Message-ID: <20170110214535.GA21354@sophia>
References: <cover.1484073324.git.vilhelm.gray@gmail.com>
 <512f7f9909c9ff6964b34e0302eeb404e703f033.1484073325.git.vilhelm.gray@gmail.com>
 <4236ccf5-1480-ea3c-fee6-35ea252e3756@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4236ccf5-1480-ea3c-fee6-35ea252e3756-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2017 at 09:13:02PM +0000, Jonathan Cameron wrote:
>On 10/01/17 18:51, William Breathitt Gray wrote:
>> PC/104 drivers should be hidden on machines which do not support PC/104
>> devices. This patch adds the PC104 Kconfig option as a dependency for
>> the relevant PC/104 device driver Kconfig options.
>> 
>> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
>> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>> Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
>> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>Now the question is how to merge this one.  Let me know if you
>want me to take this one via IIO after the first patch is in.
>If you want to take it another route I'm fine with that.
>
>Jonathan

This is such a simple patchset that I envision Greg K-H picking up all
three patches via driver-core; however, I'm pretty indifferent about the
ultimate path in the end. I'll leave it up to Greg K-H to decide.

William Breathitt Gray
