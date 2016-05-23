From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] isa: Allow ISA-style drivers on modern systems
Date: Tue, 24 May 2016 08:29:12 +1000
Message-ID: <20160524082912.258a5405@canb.auug.org.au>
References: <cover.1464029828.git.vilhelm.gray@gmail.com>
	<69b27a61a2dbaabdef53efccbabf5dda5687bf4c.1464029828.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69b27a61a2dbaabdef53efccbabf5dda5687bf4c.1464029828.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi William,

Just a small question ...

On Mon, 23 May 2016 17:20:01 -0400 William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 0a7b885..6601912 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2439,6 +2439,16 @@ config PCI_CNB20LE_QUIRK
>  
>  source "drivers/pci/Kconfig"
>  
> +config ISA_BUS
> +	bool "ISA-style bus support on modern systems" if (X86 && EXPERT)
                                                           ^^^
Is CONFIG_X86 not always true when processing this file?

-- 
Cheers,
Stephen Rothwell
