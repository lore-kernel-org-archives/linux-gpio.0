Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680128;
	b=L9sI5oO9tfF8srKRUVkOavIh0yYnA9yKwCK2Vs35Znsd8dR87MVYSrlTE6xNxeSLot1m
	 Sah3bSHD4oCDe445GywFlxs8qNrLfqLloDJLYcPen9xfw/SGtzYf5X1c6BkXYjhUdf66C
	 dH2yjhCg4LLVgz7qUL4b9xJ2Px5x4h23ZXmwKD6WTJ6ujnav4ROP/Uxay5J7u60qwE9rM
	 wMnnnp5efiuqDZ0MT75fMk2bZ+qcq+weLtXB0+JYSZy+SEkegeHFoRzlv17M3C4WSSkAp
	 aU3q4QnV4PVKQikblGQw1gSBWa9a7Z89sGeF1++Dn8mDSCpjhNMihiFSNfZ2ApulRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hUipJd0J/OpDe2EeuHFlHCASCwMqN3OdGE2YhEsXqmA=;
	b=2IxIyXfD3vJzn1S2F5cp4mh3jYNVOATvx525wJwO5/ggn/NMDGLUAYAtTOCgEL5ccNkw
	 e80Jadl3K2JpEhudhueovpaU6kYOwZuggs7kf8C/9AWBpBEoSjb1DfRXbcvatYe5WJHHo
	 gqnU8yqvBOvxJm7bPR1Fhgx9QeroQOsLno0AWEuGD/c6z9yKZjrUb4OB1RVPyjgiekWsP
	 8YvPiMTqSPwFwFhBt4AmbUvSJyymn2XGIPe7z44RWErJDzAEWZ0SV79okvEVP0BnOj944
	 CxIgvbcQ6U/qmAzrYtXI3yZOPmXdAePn9Ssr12YnwgWKzjFnpvQixwS3CWwigl8Yf6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlDufQG4;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAAB606A330
	for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 18:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAAB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlDufQG4
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so989809f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 10:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794680125; x=1795284925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUipJd0J/OpDe2EeuHFlHCASCwMqN3OdGE2YhEsXqmA=;
        b=vlDufQG4/bw4qP8w2vC4lYFGVRoG6GTtUeOhgSa4H+QhyWj9QwF2IZc1H78zqilj14
         B5x8rStlVkEe5sfbsEaUySXmXcXNLJmX8b8C+7ZiEmsgnloN9qoyLDRWnNAwk9MQbcUn
         EDJSDVNgadw7mcumg2iYYnU9bmZ+i64Rm78DWMdNbFVYZYtvbj/7tIgI5jn3mrxZD70I
         SW44JhLwWU/4Uh6vDxhIiUWdyfi5gZzIY1gC3shyoymLwbwvuituYgk6RFBQdXOqJ1+d
         x/Lw3Gc025Dbl/Hzy17TMu5PB+iViTlR0OkTqxMShSiXxEyvmQbMJrvPl18M3JXnD9kB
         ONRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680125; x=1795284925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUipJd0J/OpDe2EeuHFlHCASCwMqN3OdGE2YhEsXqmA=;
        b=xtrnSF84fwk8Q017eqN5VI1u2EfEuyhUPAV9Rk8fheQu2VAjTqCjKlBNmvHn/ACaJm
         NhdGr/fM7KMLCIqmPap33p8yCQOwtBsIbFo+DxkZnvob8KM7eu7qkUWujY/VtvZaAbUO
         qXStdEdPS/TCApxau2GqyCDHJza/wjpWlanniwBYnvZzMDk7zMp0+L4beMuL2xyONhuW
         wsq/YtbX1WrRYxhrUht1/LjqQE9ThW+TWVtw7+BNscaXHbh7Dwqcnaz5nWeL69Xc7jja
         1yzI++dRT0oxkINZ1A8sATnnGVdPUbRpYWRgAA2y7KbgF326cnv4K/1kcW/Os1spIIz4
         jJGw==
X-Forwarded-Encrypted: i=1; AL+hErGbBfkbPkTkz43bWsVPADWiVjrWGHqehCMWrQosmndgbtVgtHckUYNcPPAeBaEE+c//oCNc7GI68Pm4@vger.kernel.org
X-Gm-Message-State: APuU4Z8mjr4PMMhz/Lp0AkUpRHyw7qNaNNElG1MCSk1gu+0N0byGrsZq
	sL6CT6xg3CI/xcIncjsUCQ+5QRHML8PzwNITZJ2ljPTIU9AE20qtZ4t0
X-Gm-Gg: AYBFou1guylIAtGRJOteprtLgaIsWMWah4/MHcF9nWGcck7W4MMGpLhZilzcnFnjqi6
	v1+EcyOjhIHCN74UZmBnO4r2EaaO3eAoC460ii8txuOFlz31q+koXMaiYnTOwARSpPpo5Hk0p/U
	1s/4WraMtu3ohBHFnf3BUIiFkcF9ex/FYUHvoxzVvyKGhawH/us2pvrgRA+/fd0I733T5en6Ggg
	4/EgTTww6VBvDks9ejePuWx7u7vNdIptQ+jE9olP/YFbVIpgZl4lk2SiPzf50PflQHXz/Ub46YU
	P53XsSRiTf07+9DP9x+rLuNIHHr6xRX4h0lvfSK6fNtxSIF8FVXyQHi2jNzRE7dbZwIwARvFVcy
	B5Ey0ThXV6Xpnm4DMGjvRqQqt5wG5FY1Uc7E9r97GcDfg4wqbHa7e7XCEMcBo1T5RqRBWnTILx3
	3mSppsA2rX1J2etzbBnwFjMyQ0OeMgM55lHDzVYpQE2a4jl5mr2ZUTdUaUc5kQ3evaYRxWXVyaL
	tEEPE6xQyLQ6gKugTQ3AmfUMLpIjjLetF6YlKCWuiFXoJJnLtQ8cLaR25gIKhCtBtZHD6cvsK6L
	0ZzNcxSTK0MnSndXqw==
X-Received: by 2002:a05:6000:2613:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-49c7467b551mr11339501f8f.51.1794680124359;
        Sat, 14 Nov 2026 10:15:24 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm12239225f8f.39.2026.11.14.10.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:15:23 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: linux-leds@vger.kernel.org
Cc: riku.voipio@iki.fi,
	lee@kernel.org,
	pavel@kernel.org,
	griffin@kroah.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH v3] leds: pca9532: Propagate I2C errors
Date: Sat, 14 Nov 2026 18:14:38 +0000
Message-ID: <20261114181438.22204-1-t3127430@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114172431.11075-1-t3127430@gmail.com>
References: <20261114172431.11075-1-t3127430@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check return values from SMBus read and write operations and
propagate errors through LED, PWM, blink and GPIO operations.

Restore previous LED and PWM state when hardware updates fail.
Protect shared LED and PWM state with the update mutex.

Check register writes during device initialization and register
LED class devices only after successfully configuring the hardware.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/leds/leds-pca9532.c | 313 ++++++++++++++++++++++++++++--------
 1 file changed, 250 insertions(+), 63 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c8085427696f..eb9020e77b46 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -144,68 +144,147 @@ static int pca9532_calcpwm(struct i2c_client *client, int pwm, int blink,
 	return 0;
 }
 
-static int pca9532_setpwm(struct i2c_client *client, int pwm)
+static int __pca9532_setpwm(struct i2c_client *client, int pwm)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
-	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
-		data->pwm[pwm]);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
-		data->psc[pwm]);
-	mutex_unlock(&data->update_lock);
-	return 0;
-}
+	if (pwm < 0 || pwm > 1)
+		return -EINVAL;
+
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PWM(maxleds, pwm),
+					data->pwm[pwm]);
+	if (ret < 0) {
+		dev_warn(&client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+		return ret;
+	}
 
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PSC(maxleds, pwm),
+					data->psc[pwm]);
+	if (ret < 0)
+		dev_warn(&client->dev,
+			 "Failed to write PSC register: %d\n", ret);
+
+	return ret;
+}
 /* Set LED routing */
-static void pca9532_setled(struct pca9532_led *led)
+static int __pca9532_setled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
-	char reg;
+	int reg;
+	int ret;
 
-	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
+	if (reg < 0) {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+		return ret;
+	}
+
 	/* zero led bits */
-	reg = reg & ~LED_MASK(led->id);
+	reg &= ~LED_MASK(led->id);
+
 	/* set the new value */
-	reg = reg | (led->state << LED_SHIFT(led->id));
-	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+	reg |= led->state << LED_SHIFT(led->id);
+
+	ret = i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+
+	if (ret < 0)
+		dev_warn(&client->dev, "Failed to write LED register: %d\n", ret);
+
+	return ret;
+}
+
+static int pca9532_setled(struct pca9532_led *led)
+{
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = __pca9532_setled(led);
 	mutex_unlock(&data->update_lock);
+
+	return ret;
 }
 
 static int pca9532_set_brightness(struct led_classdev *led_cdev,
-	enum led_brightness value)
+				  enum led_brightness value)
 {
-	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int old_state;
+	u8 old_pwm;
+	u8 old_psc;
+	bool pwm_updated = false;
+	int restore_err;
+	int err = 0;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_0];
+	old_psc = data->psc[PCA9532_PWM_ID_0];
 
 	if (value == LED_OFF) {
 		led->state = PCA9532_OFF;
 	} else if (led->state == PCA9532_PWM1) {
-		return 0; /* Non-zero brightness shall not stop HW blinking */
+		goto out;
 	} else if (value == LED_FULL) {
 		led->state = PCA9532_ON;
 	} else {
-		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
-		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
+		led->state = PCA9532_PWM0;
+		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0,
+				      0, value);
 		if (err)
-			return err;
+			goto restore_state;
+	}
+
+	if (led->state == PCA9532_PWM0) {
+		pwm_updated = true;
+		err = __pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+		if (err < 0)
+			goto restore_state;
+	}
+
+	err = __pca9532_setled(led);
+	if (err < 0)
+		goto restore_state;
+
+	goto out;
+
+restore_state:
+	led->state = old_state;
+	data->pwm[PCA9532_PWM_ID_0] = old_pwm;
+	data->psc[PCA9532_PWM_ID_0] = old_psc;
+
+	if (pwm_updated) {
+		restore_err = __pca9532_setpwm(led->client,
+					       PCA9532_PWM_ID_0);
+		if (restore_err < 0)
+			dev_warn(&led->client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
 	}
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
-	pca9532_setled(led);
+out:
+	mutex_unlock(&data->update_lock);
 	return err;
 }
 
 static int pca9532_update_hw_blink(struct pca9532_led *led,
-				   unsigned long delay_on, unsigned long delay_off)
+				   unsigned long delay_on,
+				   unsigned long delay_off)
 {
 	struct pca9532_data *data = i2c_get_clientdata(led->client);
 	unsigned int psc;
-	int i;
+	unsigned long period;
+	u8 old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	u8 old_psc = data->psc[PCA9532_PWM_ID_1];
+	int i, ret;
 
 	/* Look for others LEDs that already use PWM1 */
 	for (i = 0; i < data->chip_info->num_leds; i++) {
@@ -223,29 +302,64 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 		}
 	}
 
-	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
-	if (psc > U8_MAX) {
-		/* Blink period too long to be handled by hardware */
+	if (delay_on > ULONG_MAX - delay_off)
+		return -EINVAL;
+
+	period = delay_on + delay_off;
+
+	if (!delay_on || !delay_off)
 		return -EINVAL;
+
+	if (period > ((U8_MAX + 1) * 1000) /
+		     PCA9532_PWM_PERIOD_DIV)
+		return -EINVAL;
+
+	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+
+	data->psc[PCA9532_PWM_ID_1] = psc;
+	data->pwm[PCA9532_PWM_ID_1] =
+		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
+
+	ret = __pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	if (ret < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
+
+		if (__pca9532_setpwm(data->client, PCA9532_PWM_ID_1) < 0)
+			dev_warn(&data->client->dev,
+				 "Failed to restore PWM settings\n");
+
+		return ret;
 	}
 
 	led->state = PCA9532_PWM1;
-	data->psc[PCA9532_PWM_ID_1] = psc;
-	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
 
-	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	return 0;
 }
 
 static int pca9532_set_blink(struct led_classdev *led_cdev,
-	unsigned long *delay_on, unsigned long *delay_off)
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
+	int old_state;
+	int restore_err;
+	u8 old_pwm;
+	u8 old_psc;
 	int err;
 
-	if (!data->hw_blink)
-		return -EINVAL;
+	mutex_lock(&data->update_lock);
+
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	old_psc = data->psc[PCA9532_PWM_ID_1];
+
+	if (!data->hw_blink) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
@@ -255,15 +369,32 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
 	if (err)
-		return err;
+		goto restore_state;
+
+	err = __pca9532_setled(led);
+	if (err < 0) {
+		led->state = old_state;
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
+
+		restore_err = __pca9532_setpwm(client, PCA9532_PWM_ID_1);
+		if (restore_err < 0)
+			dev_warn(&client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
+	}
 
-	pca9532_setled(led);
+	goto out;
 
-	return 0;
+restore_state:
+	led->state = old_state;
+out:
+	mutex_unlock(&data->update_lock);
+	return err;
 }
 
 static int pca9532_event(struct input_dev *dev, unsigned int type,
-	unsigned int code, int value)
+			 unsigned int code, int value)
 {
 	struct pca9532_data *data = input_get_drvdata(dev);
 
@@ -271,11 +402,15 @@ static int pca9532_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	/* XXX: allow different kind of beeps with psc/pwm modifications */
+	mutex_lock(&data->update_lock);
+
 	if (value > 1 && value < 32767)
 		data->pwm[PCA9532_PWM_ID_1] = 127;
 	else
 		data->pwm[PCA9532_PWM_ID_1] = 0;
 
+	mutex_unlock(&data->update_lock);
+
 	schedule_work(&data->work);
 
 	return 0;
@@ -286,27 +421,36 @@ static void pca9532_input_work(struct work_struct *work)
 	struct pca9532_data *data =
 		container_of(work, struct pca9532_data, work);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
-		data->pwm[PCA9532_PWM_ID_1]);
+	ret = i2c_smbus_write_byte_data(data->client,
+					PCA9532_REG_PWM(maxleds, 1),
+					data->pwm[PCA9532_PWM_ID_1]);
+	if (ret < 0)
+		dev_warn(&data->client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+
 	mutex_unlock(&data->update_lock);
 }
 
-static enum pca9532_state pca9532_getled(struct pca9532_led *led)
+static int pca9532_getled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
 	int reg;
-	enum pca9532_state ret = PCA9532_OFF;
+	int ret;
 
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-	if (reg >= 0)
+
+	if (reg >= 0) {
 		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
-	else
-		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
+	} else {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+	}
 	mutex_unlock(&data->update_lock);
 	return ret;
 }
@@ -328,33 +472,42 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
+	int old_state;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
 
 	if (val)
 		led->state = PCA9532_OFF;
 	else
 		led->state = PCA9532_ON;
 
-	pca9532_setled(led);
+	ret = __pca9532_setled(led);
+	if (ret < 0)
+		led->state = old_state;
 
-	return 0;
+	mutex_unlock(&data->update_lock);
+
+	return ret;
 }
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
-	unsigned char reg;
+	int reg;
 
 	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
 
+	if (reg < 0)
+		return reg;
+
 	return !!(reg & (1 << (offset % 8)));
 }
 
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 1);
-
-	return 0;
+	return pca9532_gpio_set_value(gc, offset, 1);
 }
 
 static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
@@ -394,40 +547,57 @@ static int pca9532_configure(struct i2c_client *client,
 	struct pca9532_data *data, struct pca9532_platform_data *pdata)
 {
 	int i, err = 0;
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 	int gpios = 0;
+#endif
 	u8 maxleds = data->chip_info->num_leds;
 
-	for (i = 0; i < 2; i++)	{
+	for (i = 0; i < 2; i++) {
 		data->pwm[i] = pdata->pwm[i];
 		data->psc[i] = pdata->psc[i];
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PWM(maxleds, i),
 						data->pwm[i]);
 		if (err < 0)
 			return err;
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PSC(maxleds, i),
 						data->psc[i]);
 		if (err < 0)
 			return err;
 	}
 
 	data->hw_blink = true;
+
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
+
 		led->client = client;
 		led->id = i;
 		led->type = pled->type;
+
 		switch (led->type) {
 		case PCA9532_TYPE_NONE:
 			break;
 		case PCA9532_TYPE_GPIO:
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 			gpios++;
+#endif
 			break;
 		case PCA9532_TYPE_LED:
-			if (pled->state == PCA9532_KEEP)
-				led->state = pca9532_getled(led);
-			else
+			if (pled->state == PCA9532_KEEP) {
+				err = pca9532_getled(led);
+				if (err < 0)
+					goto exit;
+
+				led->state = err;
+			} else {
 				led->state = pled->state;
+			}
+
 			led->name = pled->name;
 			led->ldev.name = led->name;
 			led->ldev.default_trigger = pled->default_trigger;
@@ -435,6 +605,15 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set LED %s state\n",
+					led->name);
+				goto exit;
+			}
+
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -442,19 +621,26 @@ static int pca9532_configure(struct i2c_client *client,
 					led->name);
 				goto exit;
 			}
-			pca9532_setled(led);
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
 			/* PWM1 is reserved for beeper so blink will not use hardware */
 			data->hw_blink = false;
 			BUG_ON(data->idev);
+
 			led->state = PCA9532_PWM1;
-			pca9532_setled(led);
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set beeper state\n");
+				goto exit;
+			}
+
 			data->idev = devm_input_allocate_device(&client->dev);
 			if (data->idev == NULL) {
 				err = -ENOMEM;
 				goto exit;
 			}
+
 			data->idev->name = pled->name;
 			data->idev->phys = "i2c/pca9532";
 			data->idev->id.bustype = BUS_HOST;
@@ -467,6 +653,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->idev->event = pca9532_event;
 			input_set_drvdata(data->idev, data);
 			INIT_WORK(&data->work, pca9532_input_work);
+
 			err = input_register_device(data->idev);
 			if (err) {
 				cancel_work_sync(&data->work);
@@ -498,8 +685,8 @@ static int pca9532_configure(struct i2c_client *client,
 			dev_warn(&client->dev, "could not add gpiochip\n");
 		} else {
 			dev_info(&client->dev, "gpios %i...%i\n",
-				data->gpio.base, data->gpio.base +
-				data->gpio.ngpio - 1);
+				 data->gpio.base, data->gpio.base +
+				 data->gpio.ngpio - 1);
 		}
 	}
 #endif
-- 
2.56.0

