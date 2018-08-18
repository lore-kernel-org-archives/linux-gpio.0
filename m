From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] gpio: brcmstb: allow 0 width GPIO banks
Date: Sat, 18 Aug 2018 02:52:11 +0200
Message-ID: <20180818005211.GC26866@lunn.ch>
References: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1534549659-15883-1-git-send-email-justinpopo6@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: justinpopo6@gmail.com
Cc: f.fainelli@gmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, gregory.0xf0@gmail.com, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 17, 2018 at 04:47:39PM -0700, justinpopo6@gmail.com wrote:
> From: Justin Chen <justinpopo6@gmail.com>
> 
> Sometimes we have empty banks within the GPIO block. This commit allows
> proper handling of 0 width GPIO banks.

Hi Justin

This is coming from DT? Why do you put 0 width banks in DT in the
first place?

      Andrew
