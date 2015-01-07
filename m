From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] mfd: dln2: add start/stop RX URBs helpers
Date: Wed, 7 Jan 2015 11:22:37 +0100
Message-ID: <20150107102237.GC22905@localhost>
References: <1418745435-2851-1-git-send-email-octavian.purdila@intel.com>
 <1418745435-2851-4-git-send-email-octavian.purdila@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418745435-2851-4-git-send-email-octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 16, 2014 at 05:57:14PM +0200, Octavian Purdila wrote:
> This is in preparation for adding suspend / resume support.
> 
> Signed-off-by: Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mfd/dln2.c | 51 +++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
> index 6d49685..75358d2 100644
> --- a/drivers/mfd/dln2.c
> +++ b/drivers/mfd/dln2.c
> @@ -587,12 +587,19 @@ static void dln2_free_rx_urbs(struct dln2_dev *dln2)
>  	int i;
>  
>  	for (i = 0; i < DLN2_MAX_URBS; i++) {
> -		usb_kill_urb(dln2->rx_urb[i]);
>  		usb_free_urb(dln2->rx_urb[i]);
>  		kfree(dln2->rx_buf[i]);
>  	}
>  }
>  
> +static void dln2_stop_rx_urbs(struct dln2_dev *dln2)
> +{
> +	int i;
> +
> +	for (i = 0; i < DLN2_MAX_URBS; i++)
> +		usb_kill_urb(dln2->rx_urb[i]);
> +}
> +
>  static void dln2_free(struct dln2_dev *dln2)
>  {
>  	dln2_free_rx_urbs(dln2);
> @@ -604,9 +611,7 @@ static int dln2_setup_rx_urbs(struct dln2_dev *dln2,
>  			      struct usb_host_interface *hostif)
>  {
>  	int i;
> -	int ret;
>  	const int rx_max_size = DLN2_RX_BUF_SIZE;
> -	struct device *dev = &dln2->interface->dev;
>  
>  	for (i = 0; i < DLN2_MAX_URBS; i++) {
>  		dln2->rx_buf[i] = kmalloc(rx_max_size, GFP_KERNEL);
> @@ -621,7 +626,19 @@ static int dln2_setup_rx_urbs(struct dln2_dev *dln2,
>  				  usb_rcvbulkpipe(dln2->usb_dev, dln2->ep_in),
>  				  dln2->rx_buf[i], rx_max_size, dln2_rx, dln2);
>  

You should remove this stray newline as well. 

> -		ret = usb_submit_urb(dln2->rx_urb[i], GFP_KERNEL);
> +	}
> +
> +	return 0;
> +}

Otherwise,

Reviewed-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
