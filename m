From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads7950: add GPIO support
Date: Mon, 4 Mar 2019 17:53:03 +0300
Message-ID: <20190304145303.GA13452@kadam>
References: <1551392209-20004-3-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <1551392209-20004-3-git-send-email-justinpopo6@gmail.com>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: f.fainelli@gmail.com, bgolaszewski@baylibre.com, linux-iio@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de, bcm-kernel-feedback-list@broadcom.com, kbuild-all@01.org, pmeerw@pmeerw.net, knaack.h@gmx.de, jic23@kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Justin,

url:    https://github.com/0day-ci/linux/commits/justinpopo6-gmail-com/iio-adc-ads7950-add-gpio-support/20190301-201828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg

smatch warnings:
drivers/iio/adc/ti-ads7950.c:530 ti_ads7950_init_hw() error: double unlock 'mutex:&st->slock'

# https://github.com/0day-ci/linux/commit/5290a7752b734ae0b2f5b343bd761366decdbbeb
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5290a7752b734ae0b2f5b343bd761366decdbbeb
vim +530 drivers/iio/adc/ti-ads7950.c

5290a775 Justin Chen 2019-02-28  506  
5290a775 Justin Chen 2019-02-28  507  static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
5290a775 Justin Chen 2019-02-28  508  {
5290a775 Justin Chen 2019-02-28  509  	int ret = 0;
5290a775 Justin Chen 2019-02-28  510  
5290a775 Justin Chen 2019-02-28  511  	mutex_lock(&st->slock);
5290a775 Justin Chen 2019-02-28  512  
5290a775 Justin Chen 2019-02-28  513  	/* Settings for Manual/Auto1/Auto2 commands */
5290a775 Justin Chen 2019-02-28  514  	/* Default to 5v ref */
5290a775 Justin Chen 2019-02-28  515  	st->cmd_settings_bitmask = TI_ADS7950_CR_RANGE_5V;
5290a775 Justin Chen 2019-02-28  516  	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
5290a775 Justin Chen 2019-02-28  517  	ret = spi_sync(st->spi, &st->scan_single_msg);
5290a775 Justin Chen 2019-02-28  518  	if (ret)
5290a775 Justin Chen 2019-02-28  519  		goto out;
5290a775 Justin Chen 2019-02-28  520  
5290a775 Justin Chen 2019-02-28  521  	/* Settings for GPIO command */
5290a775 Justin Chen 2019-02-28  522  	st->gpio_cmd_settings_bitmask = 0x0;
5290a775 Justin Chen 2019-02-28  523  	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
5290a775 Justin Chen 2019-02-28  524  	ret = spi_sync(st->spi, &st->scan_single_msg);
5290a775 Justin Chen 2019-02-28  525  	mutex_unlock(&st->slock);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^

5290a775 Justin Chen 2019-02-28  526  	if (ret)
5290a775 Justin Chen 2019-02-28  527  		goto out;
5290a775 Justin Chen 2019-02-28  528  
5290a775 Justin Chen 2019-02-28  529  out:
5290a775 Justin Chen 2019-02-28 @530  	mutex_unlock(&st->slock);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^

It's a bit disappointing that mutex_unlock() doesn't generate a warning
at runtime...  :(

5290a775 Justin Chen 2019-02-28  531  
5290a775 Justin Chen 2019-02-28  532  	return ret;
5290a775 Justin Chen 2019-02-28  533  }
5290a775 Justin Chen 2019-02-28  534  
