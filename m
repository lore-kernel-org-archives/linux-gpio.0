From: Davide Hug <d@videhug.ch>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines
 used as irq?
Date: Sat, 26 Aug 2017 00:45:14 +0200
Message-ID: <20170826004514.be093db11518876eb85f4e10@videhug.ch>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
        <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
        <alpine.DEB.2.20.1707122330060.2510@nanos>
        <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
        <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:34908 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935440AbdHYWyq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Aug 2017 18:54:46 -0400
In-Reply-To: <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

On Tue, 1 Aug 2017 09:37:12 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> I'm not so sure about that. You might be the only one with the right hardware
> to fix the problem. Also it is never our intention to discourage anyone to
> hack on the kernel.

You are right. I shouldn't give up that quickly.

I have tried a few things and I would like to ask if one of these is an appropriate approach.
Sorry this is long! If there is a better place for me to ask these, please point me there.

My main question is if "timer based polling" is the way to go, is my
approach with timers below (3.) appropriate?


Some info on the sensor
-----------------------

The sensor pulls the data line low to signal that the measurement data is ready
to be retrieved.

The datasheet[1] says the following concerning this data ready signal

> This takes a maximum of 20/80/320 ms for a 8/12/14bit measurement. The
> time varies with the speed of the internal oscillator and can be lower
> by up to 30%.

And

> The controller must wait for this Data Ready signal before restarting
> SCK to readout the data. Measurement data is stored until readout,
> therefore the controller can continue with other tasks and readout at
> its convenience.


My approaches
-------------

1. Naive approach: just `msleep` long enough.

static int sht15_measurement(struct sht15_data *data,
			     int command,
			     int timeout_msecs)
{

	(...)

	/* Just wait long enough for measurement to finish */
	if (command == SHT15_MEASURE_RH) {
		if (data->val_status & SHT15_STATUS_LOW_RESOLUTION)
			msleep(20);
		else
			msleep(80);
	} else {
		if (data->val_status & SHT15_STATUS_LOW_RESOLUTION)
			msleep(80);
		else
			msleep(320);
	}

	if (gpio_get_value(data->pdata->gpio_data)) {
		ret = sht15_connection_reset(data);
		if (ret)
			return ret;
		return -ETIME;
	}

	ret = sht15_read_data(data);

	(...)

}



2. Naive polling: `msleep` repeatedly in a loop and check for the data line to be low each time.

#define POLLING_INTERVAL=10 /* Is 10ms appropriate? */

(...)

static int sht15_measurement(struct sht15_data *data,
			     int command,
			     int timeout_msecs)
{

	(...)

	/* Poll for measurement-ready signal */
	for (i = 0; i <= timeout_msecs/POLLING_INTERVAL; ++i) {
		msleep(POLLING_INTERVAL);
		if (!gpio_get_value(data->pdata->gpio_data))
			break;
	}

	/* Timeout occurred */
	if (gpio_get_value(data->pdata->gpio_data)) {
		ret = sht15_connection_reset(data);
		if (ret)
			return ret;
		return -ETIME;
	}

	ret = sht15_read_data(data);

	(...)
}



3. Polling with timer: use a timer for polling and `wait_event_timeout` to wait for the polling to succeed.

#define POLLING_TIMER_INTERVAL=10 /* Is 10ms appropriate? */

(...)

static int sht15_measurement(struct sht15_data *data,
			     int command,
			     int timeout_msecs)
{

	(...)

	mod_timer(&data->polling_timer,
		  jiffies + msecs_to_jiffies(POLLING_TIMER_INTERVAL));

	ret = wait_event_timeout(data->wait_queue,
				 (data->measurement_state == SHT15_MEASUREMENT_READY),
				 msecs_to_jiffies(timeout_msecs));

	(...)


	ret = sht15_read_data(data);

	(...)
}

(...)

void poll_measurement_ready(unsigned long arg)
{
	struct sht15_data *data = (struct sht15_data *)arg;

	/* Check if the sensor is still measuring */
	if (gpio_get_value(data->pdata->gpio_data)) {
		mod_timer(&data->polling_timer,
			  jiffies + msecs_to_jiffies(POLLING_TIMER_INTERVAL));
	} else {
		data->measurement_state = SHT15_MEASUREMENT_READY;
		wake_up(&data->wait_queue);
	}
}


static int sht15_probe(struct platform_device *pdev)
{

(...)

	setup_timer(&data->polling_timer, poll_measurement_ready, (unsigned long)data);

(...)

}



4. Fix the irq problem in the current driver by calling `devm_request_irq` and
`devm_free_irq` instead of just using `disable_irq_nosync` and `enable_irq`,
to prevent setting as output a gpio requested as irq.



Stats
-----

I have some stats on 100 measurements for each approache above.

                 mean   min    max
1 naive sleep    0.443  0.438  0.444
2 naive polling  0.363  0.358  0.369
3 timer polling  0.344  0.334  0.357
4 irq fix        0.325  0.324  0.325

(This are times in seconds gathered with `time /sys/.../humidity1_input`)

Thanks!
Davide


[1]: https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Sensirion_Humidity_Sensors_SHT1x_Datasheet_V5.pdf
