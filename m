Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399831;
	b=oV5jc05IPUNq/Kb3EKim3qTV0+jeBZUvmowXJvJgreLDrAT0nZNciUMd+D1ai3ZEzepe
	 qmDxcScn/J46vDzcQ6oIVUbG8SrHSxseW1DL5lglyP3W1kccSOOXMeaLtXacUZPsKucam
	 NVCDKP8ZreksV3iqBIfjZXFq2MgWKeuACrJ/0JV27HiM7LNhu1eOox7tiSDQa5J6J2nzv
	 D/msLXiw9ec3WMxR8bZXjUQTloVLJ1W2TMxdj2pMIHSMhD0wEo+jlM1HTBtSpJUpx9OjU
	 VuLCELsJlpACsdN2daI3l3tFtxxA1VHn0X9IR7i3AQl6uMk5W2E4TyYGggQ8T8M6pdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ba5bYhgr6cFUpEyFJKX9JHAzh61EDkiu0uHMJZnKIBs=;
	b=XeguLrwJi8g+RQD0XKW4wYaQOeSJ1BEs1ywa9MDGuYJi8wBToB5ASeDqR5kf/fWSzdhh
	 Z3wZ4SyTsTDu35AQKFGIRGZMMbmzYALSJloKB6TAQgi73ikFrlS48vHN+aFuuAKmQjq87
	 hReLy4Q2ZeFElV09BTqoZOMeWtTIJlsdjoxbzeAGbROrTN9u6MijgU+NF/SgeZs8FYa5T
	 uGUlw2On5ZoysXUphj2DWixgBAYJQsoAGYsNFHbA/GuXc3IXfFbrQaYYEgJqlx2x4TriY
	 uoNtQfUSKwNkTg/IfC+cpkmtfpV+MDtqOFivNb/d+pxAad93vnypPsKOpYgZO59UMIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqx+qjv0;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0160A260D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D0160A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oqx+qjv0
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1269232f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399829; x=1794004629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ba5bYhgr6cFUpEyFJKX9JHAzh61EDkiu0uHMJZnKIBs=;
        b=Oqx+qjv0B9aYmzbqrMp6NkPYsKGGi6CEdI3ZwK5m4ZvQIgJD6evJAB+UldKvLqSTEZ
         BAc6YFrfJTQotqsXG3LNY7s1VE6RFYAvVn5Y+RrW0v4mrNot6K9R0Qn3SRqRmGOZtXLd
         4v4W33vfDbb2KWtX5p013ch1eFE0tQV6yIrlPH6p6zPgsLcDDH3lXQUHPfT5C12peinI
         4tA/lzTaOYjrqJYJQNTwSRjHQ8M34PdIKWhV/Nuw/+oAM3Z0851VMw4i3G75SG92CE79
         s37ATMZ76M/Mp6O8VmDLgE4BdSSP2Ya09b4eJbZB/VdP0BEDz8OjRatycIkRhNKS3MFU
         N3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399829; x=1794004629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ba5bYhgr6cFUpEyFJKX9JHAzh61EDkiu0uHMJZnKIBs=;
        b=Qp31NMZDbV7Nfo0NChzCqe8x1Nc3kdtFdtei8K/65tKlKhMo1B+QnwzmuUb1j/0mio
         t40LRnqtcM+0VKAbwQKls4fwH6joCcpnA2JRAlpTIgqG3pN558kDVoEG5X07Ze7daEVM
         fmSCFxMuIetnCELijcSkI1mZ4HQGtyrbC2JMyEqftRX8Gjwe1jjpwA06U4nRoiPZReYK
         cT6XlFQhS+S4QkyMSpqqUq+HZrg8N7/NwhIoK5gTaX2EfAafjAyeAJtFogs7VT6umAcs
         bgZbJwj+lxEPnS2bvso9m1l49EPnBV+Kyv5vTYeAKT5rsxufU2r87QdXYeAxZQBfF/6y
         QsbA==
X-Forwarded-Encrypted: i=1; AKwUvBz9FEZq/asg9KoL6n+ss/H9ezstFYOSPe8682iDdMUJSvADieXD0xk6XZyNr0b7TvuiFcQha6ftQGU3@vger.kernel.org
X-Gm-Message-State: AFq9FYIKrmCcnPxiaOv5fF+fGt7q9oVzj4+aoTITcdG5yriVm1Clymtj
	YYAqDfmQMx6yknCQKEJxJ0ImozzqWgVIuYPMzNtEBxd+02MM+t2/JKdf
X-Gm-Gg: AYBFou1LiXPXBCpEaUrlVyu6l6qjpsFnM8xZDd65tAthj9tyI9JfLPw3YXVfljfwE25
	/cXC/+Z6XLiWPv1/XWSUbpm9kHvKmaZzHTKIzR2HtWq4ppDbGja4S7umh9Q/wSWhqF7y0O8h2lH
	qqXBbBvQPlYNlKRlngzVjy2BAGch221n8zAHaPMhVtosU9LUs06H1VkASuPWNYjKsxMOQ3lmO8P
	ctKFauBVLJQIPWFo0K7CUJ8s4HsZPllWVV6UzldGDTVJ9yafbTxQyXRvkzyJH7+UTde7M7KYj/Q
	TDybrpOR6DSpP+yVPoaslbLmoGOz3pFgTcxnSRnjH72sb02Ry3XtqEZIsPh6I0H4eWEJH6ohgdR
	1Aeenf9wQnR87OqPQYuNvwGdKWyYm1BW8vN43/PHPryN9lZGM+dah5qePz4ihoH4SUX5uOa4OaW
	6YfTeO9tpLVPIGNN5sSfWVTzfY8ZJjxOO+VdVTGsziMKxbExQ5/Nc3VafuLUXeVnWd+sJaziAGb
	jBnSBJ6mDJfiqaaezij7EBJYV9QGucIw5K26DiP5gsZZ86S+LAEYBRqTWWlEkeqYQXQJmHUh5Qs
	Oqs23HuLxSSWi5I/SuT1Z3Ehtbhy
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48e6494c24fmr18207678f8f.3.1793399828561;
        Fri, 30 Oct 2026 15:37:08 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:08 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 05/15] HID: ft260: i2c: silence sysfs store big-numbers
Date: Sat, 31 Oct 2026 00:36:27 +0200
Message-ID: <20261030223637.86907-6-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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

FT260_ATTR_STORE returned the feature-report transfer length from
ft260_hid_feature_report_set() instead of the sysfs write size. For
values like 1000, userspace writes more bytes than the HID report
length, so the VFS retries the remainder and reports "Invalid argument"
even though the attribute was applied correctly:

  $ echo 1000 > .../clock
  bash: line 1: echo: write error: Invalid argument
  $ cat .../clock
  1000

Return count after a successful parse so the full write is consumed.

Do not report success when the feature report fails. Store 16-bit
attributes in little endian (reported by Sashiko).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2: do not mask a failed feature report; cpu_to_le16 on word store
(reported by Sashiko).
---
 drivers/hid/hid-ft260.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f134fab08285..d2c5c9ed7927 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1471,63 +1471,67 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 {
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
 	static ssize_t name##_show(struct device *kdev,			       \
 				   struct device_attribute *attr, char *buf)   \
 	{								       \
 		struct reptype rep;					       \
 		struct hid_device *hdev = to_hid_device(kdev);		       \
 		type *field = &rep.name;				       \
 		int len = sizeof(rep);					       \
 									       \
 		return func(hdev, id, (u8 *)&rep, len, field, buf);	       \
 	}
 
 #define FT260_SSTAT_ATTR_SHOW(name)					       \
 		FT260_ATTR_SHOW(name, ft260_get_system_status_report,	       \
 				FT260_SYSTEM_SETTINGS, u8, ft260_byte_show)
 
 #define FT260_I2CST_ATTR_SHOW(name)					       \
 		FT260_ATTR_SHOW(name, ft260_get_i2c_status_report,	       \
 				FT260_I2C_STATUS, __le16, ft260_word_show)
 
-#define FT260_ATTR_STORE(name, reptype, id, req, type, ctype, strtou, func)    \
+#define FT260_STORE_NATIVE(v) (v)
+
+#define FT260_ATTR_STORE(name, reptype, id, req, type, strtou, func, conv)     \
 	static ssize_t name##_store(struct device *kdev,		       \
 				    struct device_attribute *attr,	       \
 				    const char *buf, size_t count)	       \
 	{								       \
 		struct reptype rep;					       \
 		struct hid_device *hdev = to_hid_device(kdev);		       \
 		struct ft260_device *dev = hid_get_drvdata(hdev);	       \
 		type name;						       \
 		int ret;						       \
 									       \
-		if (!strtou(buf, 10, (ctype *)&name)) {			       \
-			rep.name = name;				       \
+		if (!strtou(buf, 10, &name)) {				       \
+			rep.name = conv(name);				       \
 			rep.report = id;				       \
 			rep.request = req;				       \
 			mutex_lock(&dev->lock);				       \
 			ret = ft260_hid_feature_report_set(hdev, (u8 *)&rep,   \
 							   sizeof(rep));       \
 			if (ret < 0)					       \
 				hid_err(hdev, "%s: failed!\n", __func__);      \
-			else						       \
+			else {						       \
 				func(hdev, req, name);			       \
+				ret = count;				       \
+			}						       \
 			mutex_unlock(&dev->lock);			       \
 		} else {						       \
 			ret = -EINVAL;					       \
 		}							       \
 		return ret;						       \
 	}
 
 #define FT260_BYTE_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u8, u8, kstrtou8, func)
+				 u8, kstrtou8, func, FT260_STORE_NATIVE)
 
 #define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 __le16, u16, kstrtou16, func)
+				 u16, kstrtou16, func, cpu_to_le16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
-- 
2.43.0

