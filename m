From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] driver: core: Allow subsystems to continue deferring probe
Date: Fri, 14 Jun 2019 12:10:10 +0200
Message-ID: <CAJZ5v0jeH3x+kfAH9D5H6507-iBdVRhAfEKb-NOdhiutwR9O_Q@mail.gmail.com>
References: <20190613170011.9647-1-thierry.reding@gmail.com>
 <20190614091058.GA25912@kroah.com> <20190614093856.GC15526@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614093856.GC15526@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, linux-gpio@vger.kernel.org, "open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 14, 2019 at 11:39 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Fri, Jun 14, 2019 at 11:10:58AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 13, 2019 at 07:00:11PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >

[cut]

>
> To avoid further back and forth, what exactly is it that you would have
> me do? That is, what do you consider to be the correct way to do this?
>
> Would you prefer me to add another function with a different name that
> reimplements the functionality only with the exception? Something along
> the lines of:
>
>         int driver_deferred_probe_check_state_continue(struct device *dev)
>         {
>                 int ret;
>
>                 ret = driver_deferred_probe_check_state(dev);
>                 if (ret == -ENODEV)
>                         return -EPROBE_DEFER;
>
>                 return ret;
>         }
>
> ? I'd need to split that up some more to avoid the warning that the
> inner function prints before returning -ENODEV, but that's a minor
> detail. Would that API be more to your liking?

Well, why don't you do

static int deferred_probe_check_state_internal(struct device *dev)
{
        if (!initcalls_done)
                return -EPROBE_DEFER;

        if (!deferred_probe_timeout) {
                dev_WARN(dev, "deferred probe timeout, ignoring dependency");
                return -ETIMEDOUT;
        }

        return 0;
}

int driver_deferred_probe_check_state(struct device *dev)
{
        int ret = deferred_probe_check_state_internal(dev);

        if (ret)
                 return ret;

        dev_warn(dev, "ignoring dependency for device, assuming no driver");
        return -ENODEV;
}

int driver_deferred_probe_check_state_continue(struct device *dev)
{
        int ret = deferred_probe_check_state_internal(dev);

        if (ret)
                 return ret;

        return -EPROBE_DEFER;
}
